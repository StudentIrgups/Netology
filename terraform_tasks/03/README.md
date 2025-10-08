# Задание 1

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/1.png?raw=true)

# Задание 2
** 2.1

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/2.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/3.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/4.png?raw=true)

** 2.2

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/5.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/6.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/7.png?raw=true)

** 2.4

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/8.png?raw=true)

** 2.5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/9.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/10.png?raw=true)

# Задание 3

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/11.png?raw=true)

# Задание 4

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/12.png?raw=true)

https://github.com/StudentIrgups/Netology/commit/371bc2534035552ec5ff3a9ea66b183212bcfa11

# Задание 5

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/13.png?raw=true)

# Задание 6

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/03/14.png?raw=true)

https://github.com/StudentIrgups/Netology/commit/7c8fe3a9a19e997f4b9c720131c7ee7b7fbc9f45

# Задание 7

# Задание 8

Получение platform_id из массива по индексу необходимо делать без пробела: platform_id=${i["platform_id"]}

# Задание 9

** 9.1
	[for x in range(99) : "rc${x+1}" ]
	
** 9.2 
	[for x in range(99) : "rc${x+1}" if x % 10 != 6 && x % 10 != 7 && x % 10 != 8 && x % 10 != 9 || x == 18  ]