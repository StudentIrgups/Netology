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

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/3.png?raw=true)

** 2.2

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/4.png?raw=true)

** 2.3

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/5.png?raw=true)

** 2.4

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/6.png?raw=true)

** 2.5

https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/src/terraform-docs.md


# Задание 3
** 3.1

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/7.png?raw=true)

** 3.2

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/8.png?raw=true)

** 3.3

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/9.png?raw=true)

** 3.4

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/10.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/11.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/12.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/13.png?raw=true)

# Задание 4

Plan:

```

+ resource "yandex_vpc_subnet" "develop" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "ru-central1-a"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # module.vpc_dev.yandex_vpc_subnet.develop["ru-central1-b"] will be created
  + resource "yandex_vpc_subnet" "develop" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "ru-central1-b"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.2.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-b"
    }

  # module.vpc_dev.yandex_vpc_subnet.develop["ru-central1-d"] will be created
  + resource "yandex_vpc_subnet" "develop" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "ru-central1-d"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.3.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-d"
    }
```

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/14.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/15.png?raw=true)

# Задание 5


# Задание 6

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/16.png?raw=true)

Хранилище создалось, однако ошибка, которую мне не удалось побороть. В процессе гугления стало ясно, 
что это "косяк" со стороны Yandex.

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/17.png?raw=true)
