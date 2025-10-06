resource "yandex_compute_disk" "disk" {
    count =  3 
    name  = "disk${count.index}"
    size  = 1    
}

resource "yandex_compute_instance" "storage" {  
  name     = "storage"

  platform_id = var.vm_platform_id
  resources { 
    cores         = 2
    memory        = 2
    core_fraction = 20
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
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = local.serial-port-enable
    ssh-keys           = "${local.ssh-keys}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk[*]
    content {
      disk_id = lookup(secondary_disk.value, "id", null)
    }
  }
}