resource "yandex_compute_instance" "databases" {
  for_each = var.each_vm
  name     = each.value.vm_name

  platform_id = var.vm_platform_id
  resources { 
    cores         = each.value.cpu
    memory        = each.value.ram
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
}