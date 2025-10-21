
resource "null_resource" "push-container" {
  depends_on = [ yandex_container_registry.default ]
  triggers = {
    registry_id = yandex_container_registry.default.id
  }
  provisioner "local-exec" {
    command = <<-EOT
      export REGISTRY_ID=${yandex_container_registry.default.id}
      echo ${var.token} | docker login --username oauth --password-stdin cr.yandex
      touch ./webapp/.Dockerfile

      echo 'FROM python:3.12-slim AS builder
      COPY ./webapp/requirements.txt ./
      RUN pip install -r requirements.txt
      
      FROM builder
      COPY ./webapp .
      CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]' > ./webapp/.Dockerfile   
      docker build . -t cr.yandex/${yandex_container_registry.default.id}/webapp:latest -f ./webapp/.Dockerfile
      docker push cr.yandex/${yandex_container_registry.default.id}/webapp:latest
    EOT
  }
  provisioner "local-exec" {
    when =  destroy
    command = "yc container image delete cr.yandex/${self.triggers.registry_id}/webapp:latest"    
    on_failure = continue
  }
}