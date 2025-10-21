output "network_id" {
    value = yandex_vpc_network.project.id
}

output "subnet_id" {
  value =  [
    for k in yandex_vpc_subnet.project: {
      id   = k.id
    }     
  ] 
}