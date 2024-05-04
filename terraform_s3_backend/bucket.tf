resource "yandex_iam_service_account" "sast" {
  name = "srcac01"
}

// Assigning roles to the service account
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sast.id}"
}

// Creating a static access key
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sast.id
  description        = "static access key for object storage"
}

resource "yandex_resourcemanager_folder_iam_member" "admin" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.sast.id}"
}

// Creating a bucket using the key
resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "bondarcl03"
  grant {
    id          = yandex_iam_service_account.sast.id
    type        = "CanonicalUser"
    permissions = ["FULL_CONTROL"]
  }
}
data "yandex_dns_zone" "primary" {
    name = "devride-ru"
}

output "access_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  sensitive = true
}
output "secret_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  sensitive = true
}


