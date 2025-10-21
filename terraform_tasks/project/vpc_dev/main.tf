
resource "yandex_vpc_network" "project" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "project" {
  for_each =  { for zone in var.mass_zones : zone.name => zone }
  name           = each.value.name
  zone           = each.value.name
  network_id     = yandex_vpc_network.project.id
  v4_cidr_blocks = [ each.value.cidr ]
}