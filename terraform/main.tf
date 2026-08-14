terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.22"
    }
  }
}

provider "postgresql" {
  host            = var.pg_host
  port            = var.pg_port
  database        = "postgres"
  username        = var.pg_admin_user
  password        = var.pg_admin_password
  sslmode         = "disable"
  connect_timeout = 30
}

resource "postgresql_role" "appuser" {
  name     = var.app_user
  login    = true
  password = var.app_password
}

resource "postgresql_database" "terraformdb" {
  name  = var.db_name
  owner = postgresql_role.appuser.name
}

resource "postgresql_grant" "db_connect" {
  database    = postgresql_database.terraformdb.name
  role        = postgresql_role.appuser.name
  object_type = "database"
  privileges  = ["CONNECT"]
}

resource "postgresql_role" "users" {
  for_each = var.databases

  name     = each.value.username
  login    = true
  password = each.value.password
}

resource "postgresql_database" "databases" {
  for_each = var.databases

  name  = each.key
  owner = postgresql_role.users[each.key].name
}
