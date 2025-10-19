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