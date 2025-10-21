resource "yandex_mdb_mysql_cluster" "my_cluster" {
  name        = "test"
  environment = "PRESTABLE"
  network_id  = module.vpc_dev.network_id
  version     = "8.0"

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-ssd"
    disk_size          = 16
  }

  mysql_config = {
    sql_mode                      = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
    max_connections               = 100
    default_authentication_plugin = "MYSQL_NATIVE_PASSWORD"
    innodb_print_all_deadlocks    = true
    
  }

  host {
    zone      = var.default_zone
    subnet_id = module.vpc_dev.subnet_id[0].id
  }
}

resource "yandex_mdb_mysql_database" "virtd" { 
  depends_on = [ yandex_mdb_mysql_cluster.my_cluster ]
  cluster_id = yandex_mdb_mysql_cluster.my_cluster.id
  name       = "virtd"

}

resource "yandex_mdb_mysql_user" "app" {
  depends_on = [ yandex_mdb_mysql_cluster.my_cluster, yandex_mdb_mysql_database.virtd ]
  cluster_id = yandex_mdb_mysql_cluster.my_cluster.id
  name       = "app"
  password   = "p@ssw0rd"   
  permission {
    database_name = yandex_mdb_mysql_database.virtd.name
    roles = ["ALL" ]     
  }
}
