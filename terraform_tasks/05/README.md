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

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/1.png?raw=true)

** 2.2

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/2.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/3.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/4.png?raw=true)

** 2.3

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/5.png?raw=true)

** 2.4 & 2.5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/6.png?raw=true)

** 2.6

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/7.png?raw=true)

# Задание 3

https://github.com/StudentIrgups/Netology/pull/4

# Задание 4


![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/8.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/9.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/10.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/11.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/12.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/13.png?raw=true)

# Задание 5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/14.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/15.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/16.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/17.png?raw=true)

# Задание 6

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/16.png?raw=true)

Хранилище создалось, однако ошибка, которую мне не удалось побороть. В процессе гугления стало ясно, 
что это "косяк" со стороны Yandex.

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/04/17.png?raw=true)
