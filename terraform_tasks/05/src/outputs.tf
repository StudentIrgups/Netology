output "out" {    
    value=concat(module.marketing-vm.external_ip_address, module.analytics-vm.external_ip_address)
}