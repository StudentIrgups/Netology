output "web" {
  value =  [
    for k in yandex_compute_instance.web: {
      name = k.name
      id   = k.id
      fqdn = k.fqdn
    }     
  ]  
}

output "db" {
  value =  [
    for k in yandex_compute_instance.databases: {
      name = k.name
      id   = k.id
      fqdn = k.fqdn
    }     
  ]  
}
