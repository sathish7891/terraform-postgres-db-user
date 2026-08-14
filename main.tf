terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.22"
    }
  }
}

provider "postgresql" {
  host            = "localhost"
  port            = 5522
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "disable"
}

resource "postgresql_database" "mydb" {
  name = "terraformdb"
}
