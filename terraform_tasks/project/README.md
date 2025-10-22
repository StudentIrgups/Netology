# Финальный проект
** 1
	Для работы проекта необходимо на yandex cloud настроить Object storage:

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/1.png?raw=true)		

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/2.png?raw=true)

	Имя bucket-а скопируйте в provider.tf:
	
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/10.png?raw=true)	

	Также необходимо настроить Managed service for YDB:
	
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/3.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/4.png?raw=true)
	
	Полученную таблицу (имя) скопировать в файл providers.tf переменная dynamodb_table, пример:
	
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/8.png?raw=true)	

	Из YDB скопируйте ссылку на API (Document API):
	
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/9.png?raw=true)	

	Создать Identity and access menagment (сервисный аккаунт):
	
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/5.png?raw=true)

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/6.png?raw=true)

	В сервисном аккаунте необходимо создать статический ключ (СК):

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/7.png?raw=true)

	Полученные, в процессе создания СК, access_key и secret_key необходимо сохранить у себя на ПК. 
	
** 2

	Инициализируйте проект команндой:

```

terraform init -backend-config="access_key=<ваш access_key>" -backend-config="secret_key=<ваш secret_key>" 
```

** 3

	Примините изменения:

```

terraform apply
```	

** 4

	После сборки проетка в stdout выведется IP адрес виртуальной машины(ВМ):
	
![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/11.png?raw=true)

** 5
	
	В созданной ВМ будет автоматически запущено приложение WEPAPP, оно будет доступно по полученному IP 
	на 443 порту (Внимание! После создания ВМ необходимо некоторое время для автонастройки ВМ, то есть 
	WEBAPP сразу доступно не будет!):

![Figure 1-1](https://github.com/StudentIrgups/Netology/blob/main/terraform_tasks/project/12.png?raw=true)