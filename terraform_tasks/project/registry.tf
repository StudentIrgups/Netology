resource "yandex_container_registry" "default" {
  name      = "registry"
  folder_id = var.folder_id
}
