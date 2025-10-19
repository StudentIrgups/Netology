# Задание 1
** Проверка tflint:
	Warnings:
		- при подключении модуля, в параметре source, указана ветка как ref=main, такого быть не должно;
		- элеметы списка должны быть заключены в квадратные скобки, то есть записи вида: module.vpc_dev.subnet_id.0.id
		  недопустимы, нужно использовать что-то вроде: module.vpc_dev.subnet_id[0].id;
		- пропущено указание версии провайдера в data "template_file";
		- есть объявление переменных, но они нигде не использованы;
** Проверка checkov:
	- проверки вычислительных ресурсов на то, чтобы не было внешних IP;
	- проверка на то, чтобы группа безопасности была присвоена сети;
	- указание на то, что в source не нужно использовать ref=main, а необходимо указывать hash ревизии;
	- указание на то, что в модулях не указана версия;
		
# Задание 2
** 2.1

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/1.png?raw=true)

** 2.2

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/2.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/3.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/4.png?raw=true)

** 2.3

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/5.png?raw=true)

** 2.4 & 2.5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/6.png?raw=true)

** 2.6

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/7.png?raw=true)

# Задание 3

https://github.com/StudentIrgups/Netology/pull/4

# Задание 4


![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/8.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/9.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/10.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/11.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/12.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/13.png?raw=true)

# Задание 5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/14.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/15.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/16.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/05/17.png?raw=true)

# Задание 7

Написать, написал, а применить не получается, так как какая-то проблема со стороны yandex с s3.
```

resource "yandex_iam_service_account" "sa" {
  name = "tfstatenew"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

resource "yandex_ydb_database_serverless" "new_ydb" {
  name = "new-ydb"
  folder_id = var.folder_id

}

resource "yandex_ydb_table" "tfstate-lock" {
  connection_string = yandex_ydb_database_serverless.new_ydb.ydb_full_endpoint
  path = "tfstate-lock"

  column {
     name = "lockID"
     type = "Utf8"     
  }
  primary_key = ["lockID"]
}

resource "yandex_storage_bucket" "test" {
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket                = "to-save"
  max_size              = 1
  
  anonymous_access_flags {
    read        = true
    list        = true
    config_read = true
  }

}
```
