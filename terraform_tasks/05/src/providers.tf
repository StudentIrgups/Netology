terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.80.0"
    }
  }
  required_version = ">=1.8.4"

  backend "s3" {
    endpoints ={
      dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1ggcn8va1l6908f7dkp/etnnle3avt6t4c81riom"
      s3       = "https://storage.yandexcloud.net"
    }

    bucket = "hardening-bucket-xot1zjzc" 
    region ="ru-central1"
    key    = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true 
    skip_s3_checksum            = true

    dynamodb_table = "tfstate-lock"
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = file("~/.authorized_key.json")
}