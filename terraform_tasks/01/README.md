* Для хранения чувствительной информации файл: personal.auto.tfvars;
* Намеренная ошибка говорит о том, что метка ресурса должна начинаться с букв, но не цифр, неверный путь до пароля, не указана вторая метка ресурса nginx;
* Мне кажется, что используя -auto-approve можно нечаянно слить пароли, токены в сеть;
* Возможно, ключ -auto-approve необходим, когда нужно запускать команду apply без участия оператора;
* Docker образ nginx:latest не был удалён, так как в конфигурации для ресурса nginx было указано keep_locally = true, что подтверждает абзац из документации: keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.