# Задание 1

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/1.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/2.png?raw=true)

<details>
	<summary>terraform console -> module.marketing-vm</summary>
~~~	console
module.marketing-vm
{
  "all" = [
    {
      "allow_recreate" = tobool(null)
      "allow_stopping_for_update" = true
      "boot_disk" = tolist([
        {
          "auto_delete" = true
          "device_name" = "fhmc5833isqm64pu1622"
          "disk_id" = "fhmc5833isqm64pu1622"
          "initialize_params" = tolist([
          {
              "block_size" = 4096
              "description" = ""
              "image_id" = "fd835n822mf701mmsu7i"
              "kms_key_id" = ""
              "name" = ""
              "size" = 10
              "snapshot_id" = ""
              "type" = "network-hdd"
            },
          ])
          "mode" = "READ_WRITE"
        },
      ])
      "created_at" = "2025-10-13T11:51:51Z"
      "description" = "TODO: description; {{terraform yyy managed}}"
      "filesystem" = toset([])
      "folder_id" = "b1g979msp4t7ort8en3e"
      "fqdn" = "stage-webs-0.ru-central1.internal"
      "gpu_cluster_id" = ""
      "hardware_generation" = tolist([
        {
          "generation2_features" = tolist([])
          "legacy_features" = tolist([
            {
              "pci_topology" = "PCI_TOPOLOGY_V2"
            },
          ])
        },
      ])
      "hostname" = "stage-webs-0"
      "id" = "fhmuoj64g0kul0e6nt8m"
      "labels" = tomap({
        "project" = "marketing"
      })
      "local_disk" = tolist([])
      "maintenance_grace_period" = ""
      "maintenance_policy" = tostring(null)
      "metadata" = tomap({
        "serial-port-enable" = "1"
        "user-data" = <<-EOT
        #cloud-config
        users:
          - name: ubuntu
            groups: sudo
            shell: /bin/bash
            sudo: ["ALL=(ALL) NOPASSWD:ALL"]
            ssh_authorized_keys:
              - ssh-rsa secret
        package_update: true
        package_upgrade: false
        packages:
          - vim
        write_files:
          - path: "/usr/local/etc/startup.sh"
            permissions: "755"
            content: |
              #!/bin/bash
        
              apt-get update
              apt-get install -y nginx
              service nginx start
            defer: true
        runcmd:
          - ["/usr/local/etc/startup.sh"]
        
        EOT
      })
      "metadata_options" = tolist([
        {
          "aws_v1_http_endpoint" = 1
          "aws_v1_http_token" = 2
          "gce_http_endpoint" = 1
          "gce_http_token" = 1
        },
      ])
      "name" = "stage-webs-0"
      "network_acceleration_type" = "standard"
      "network_interface" = tolist([
        {
          "dns_record" = tolist([])
          "index" = 0
          "ip_address" = "10.0.1.10"
          "ipv4" = true
          "ipv6" = false
          "ipv6_address" = ""
          "ipv6_dns_record" = tolist([])
          "mac_address" = "d0:0d:1e:c4:cc:48"
          "nat" = true
          "nat_dns_record" = tolist([])
          "nat_ip_address" = "158.160.126.199"
          "nat_ip_version" = "IPV4"
          "security_group_ids" = toset(null) /* of string */
          "subnet_id" = "e9bklnqv9j51715soqc3"
        },
      ])
      "placement_policy" = tolist([
        {
          "host_affinity_rules" = tolist([])
          "placement_group_id" = ""
          "placement_group_partition" = 0
        },
      ])
      "platform_id" = "standard-v1"
      "resources" = tolist([
        {
          "core_fraction" = 5
          "cores" = 2
          "gpus" = 0
          "memory" = 1
        },
      ])
      "scheduling_policy" = tolist([
        {
          "preemptible" = true
        },
      ])
      "secondary_disk" = toset([])
      "service_account_id" = ""
      "status" = "running"
      "timeouts" = null /* object */
      "zone" = "ru-central1-a"
    },
  ]
  "external_ip_address" = [
    "158.160.126.199",
  ]
  "fqdn" = [
    "stage-webs-0.ru-central1.internal",
  ]
  "internal_ip_address" = [
    "10.0.1.10",
  ]
  "labels" = [
    tomap({
      "project" = "marketing"
    }),
  ]
  "network_interface" = [
    tolist([
      {
        "dns_record" = tolist([])
        "index" = 0
        "ip_address" = "10.0.1.10"
        "ipv4" = true
        "ipv6" = false
        "ipv6_address" = ""
        "ipv6_dns_record" = tolist([])
        "mac_address" = "d0:0d:1e:c4:cc:48"
        "nat" = true
        "nat_dns_record" = tolist([])
        "nat_ip_address" = "158.160.126.199"
        "nat_ip_version" = "IPV4"
        "security_group_ids" = toset(null) /* of string */
        "subnet_id" = "e9bklnqv9j51715soqc3"
      },
    ]),
  ]
}
~~~
</details>
# Задание 2
** 2.1



![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/3.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/4.png?raw=true)

** 2.2

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/5.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/6.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/7.png?raw=true)

** 2.4

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/8.png?raw=true)

** 2.5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/9.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/10.png?raw=true)

# Задание 3

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/11.png?raw=true)

# Задание 4

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/12.png?raw=true)

https://github.com/StudentIrgups/Netology/commit/371bc2534035552ec5ff3a9ea66b183212bcfa11

# Задание 5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/13.png?raw=true)

# Задание 6

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/14.png?raw=true)

https://github.com/StudentIrgups/Netology/commit/7c8fe3a9a19e997f4b9c720131c7ee7b7fbc9f45

# Задание 7

# Задание 8

Получение platform_id из массива по индексу необходимо делать без пробела: platform_id=${i["platform_id"]}

# Задание 9

** 9.1
	[for x in range(99) : "rc${x+1}" ]
	
** 9.2 
	[for x in range(99) : "rc${x+1}" if x % 10 != 6 && x % 10 != 7 && x % 10 != 8 && x % 10 != 9 || x == 18  ]
