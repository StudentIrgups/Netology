module "vpc_dev" {
  source       = "./vpc_dev"
  vpc_name     = var.vpc_name
  cloud_id     = var.cloud_id
  folder_id    = var.folder_id
  mass_zones   = [
    { name = var.default_zone, cidr = var.default_cidr[0] },
  ]
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_ubuntu_version
}


resource "yandex_compute_instance" "web" {
  depends_on = [null_resource.push-container, yandex_mdb_mysql_user.app]
  count       = 1
  name        = "web${count.index + 1}"
  platform_id = var.vm_platform_id
  resources { 
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id          = module.vpc_dev.subnet_id[0].id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
  
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
 
  vars = {
    ssh_public_key = file("~/.ssh/ssh-key-1756817743452.pub")    
    registry_id    = yandex_container_registry.default.id
    ya_token       = var.token
    image          = "cr.yandex/${yandex_container_registry.default.id}/webapp:latest"
    db_user        = yandex_mdb_mysql_user.app.name
    db_password    = yandex_mdb_mysql_user.app.password
    db_fqdn        = yandex_mdb_mysql_cluster.my_cluster.host[0].fqdn
    db_dbname      = yandex_mdb_mysql_database.virtd.name
  }
}
