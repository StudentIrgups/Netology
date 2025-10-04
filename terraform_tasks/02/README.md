# Задание 1
	1.5
		* Первая ошибка, которую обнаружил, была с platform_id, судя по документации яндекс 
		это тип создаваемой ВМ и он должен быть standard v3
		* Вторая ошибка, с настройкой "железа". Согласно YC core_fraction может быть не менее 20%
	1.8
		* Параметры preemptible = true & core_fraction = 5 могут помочь съэкономить средства в YC
		

## YC concole:
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/1.png?raw=true)
	
## curl ifconfig.me
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/2.png?raw=true)

# Задание 2
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/3.png?raw=true)

# Задание 3
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/4.png?raw=true)

# Задание 4
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/5.png?raw=true)

# Задание 5
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/6.png?raw=true)

# Задание 6
	6.1
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/7.png?raw=true)
	6.2
	Переменную для ssh-keys создавать не буду, так как мне придётся в map(object) явно указать ключ
	соединения по SSH, что не безопасно.
	
# Задание 7
	7.1 
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/8.png?raw=true)	
	7.2
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/9.png?raw=true)	
	7.3
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/10.png?raw=true)
	7.4
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/11.png?raw=true)			

# Задание 8
	8.1 
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/12.png?raw=true)	
	8.2
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/13.png?raw=true)	

# Задание 9
	Шлюз сделал, ВМ без IP. Как подключаться через serial console я не понял. Если нет IP куда подключаться?
	![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/02/14.png?raw=true)	