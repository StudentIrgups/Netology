module "vpc_dev" {
  source       = "./vpc_dev"
  vpc_name     = var.vpc_name
  cloud_id     = var.cloud_id
  folder_id    = var.folder_id
  mass_zones   = [
    { name = "ru-central1-a", cidr = "10.0.1.0/24" },
    { name = "ru-central1-b", cidr = "10.0.2.0/24" },
    { name = "ru-central1-d", cidr = "10.0.3.0/24" },
  ]
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=09144db7f136b793064f1ac593fe2ac6921932f0"
  env_name       = "stage" 
  network_id     = module.vpc_dev.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc_dev.subnet_id[0].id]
  instance_name  = "webs"
  instance_count = 0
  image_family   = "ubuntu-2004-lts"
  public_ip      = false
  security_group_ids = [yandex_vpc_security_group.example.id]

  labels = { 
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics-vm" {
  source             = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=09144db7f136b793064f1ac593fe2ac6921932f0"
  env_name           = "stage"
  network_id         = module.vpc_dev.network_id
  subnet_zones       = ["ru-central1-a"]
  subnet_ids         = [module.vpc_dev.subnet_id[0].id]
  instance_name      = "web-stage"
  instance_count     = 0
  image_family       = var.ubuntu_version
  public_ip          = false
  security_group_ids = [yandex_vpc_security_group.example.id]

  labels = { 
    project = "analytics"
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
  }
}
