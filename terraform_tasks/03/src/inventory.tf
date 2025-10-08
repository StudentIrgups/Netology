resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl", { 
    webservers = yandex_compute_instance.web
    databases  = yandex_compute_instance.databases
    storage    = yandex_compute_instance.storage
  })
  filename = "${abspath(path.module)}/hosts.ini"
}

resource "local_file" "hosts_for" {
  content =  <<-EOT
  %{~ if length(yandex_compute_instance.web) > 0 ~}
  [webservers]
  %{~ for i in yandex_compute_instance.web ~}
    %{~ for k, v in i["network_interface"][0] ~}
      %{~ if k == "ip_address" && i["network_interface"][0]["nat"] == false ~}
        ${i["name"]}  ansible_host=${v}
      %{~ endif ~}
      %{~ if k == "nat_ip_address" && i["network_interface"][0]["nat"] == true ~}
        ${i["name"]}  ansible_host=${v}
      %{~ endif ~}
    %{~ endfor ~}
  %{~ endfor ~}
  %{~ endif ~}
  %{if length(yandex_compute_instance.databases) > 0}
  [databases]
  %{for i in yandex_compute_instance.databases }
  ${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}

  [all:vars]
  ansible_ssh_common_args='-o ProxyCommand="ssh -p 22 -W %h:%p -q ubuntu@${i["network_interface"][0]["nat_ip_address"]}"'
  %{endfor}
  %{endif}

  %{if length(yandex_compute_instance.storage) > 0}
  [storage]
  %{for i in yandex_compute_instance.storage[*] }
    ${i["name"]}   ansible_host=${i["network_interface"][0]["nat_ip_address"]}
  %{endfor}
  %{endif}
  EOT
  filename = "${abspath(path.module)}/for.ini"
}

locals{
  instances_yaml= concat(yandex_compute_instance.web[*], yandex_compute_instance.storage[*])
}

resource "local_file" "hosts_yaml" {
  content =  <<-EOT
  all:
    hosts:
    %{ for i in local.instances_yaml ~}
      ${i["name"]}:
            ansible_host: ${i["network_interface"][0]["nat_ip_address"]}
            ansible_user: ubuntu
    %{ endfor ~}
    %{ for i in yandex_compute_instance.databases[*] ~}
      %{ for j in i ~}
        ${j["name"]}:
            ansible_host: ${j["network_interface"][0]["nat_ip_address"]}
            ansible_user: ubuntu
      %{ endfor ~}
    %{ endfor ~}
  EOT
  filename = "${abspath(path.module)}/hosts.yaml"
}
