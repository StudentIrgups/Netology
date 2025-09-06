source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "b1g979msp4t7oxxxxxxxxx"
  image_description   = "my custom debian with docker"
  image_name          = "debian-12-docker"
  source_image_family = "debian-12"
  ssh_username        = "debian"
  subnet_id           = "e9bsp6qqggv4p3xxxxxxxx"
  token               = "y0__xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
	"curl -fsSl https://get.docker.com -o get-docker.sh",
	"sudo sh ./get-docker.sh",
	"sudo apt-get update -y",
	"sudo apt-get install -y htop",	
	"sudo apt-get install -y tmux"
    ]
  }
}
