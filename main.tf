resource "random_password" "password" {
  length  = 16
  special = true
}

resource "google_sql_database_instance" "main" {
  project          = var.project_name
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  // We allow internet access only for lab purpose
  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "internet"
        value = "0.0.0.0/0"
      }
    }
  }
}

resource "google_sql_user" "users" {
  project  = var.project_name
  name     = var.username
  instance = google_sql_database_instance.main.name
  password = random_password.password.result
}

resource "google_secret_manager_secret" "db" {
  project   = var.project_name
  secret_id = "sql_user_password"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db" {
  secret      = google_secret_manager_secret.db.id
  secret_data = google_sql_user.users.password
}
