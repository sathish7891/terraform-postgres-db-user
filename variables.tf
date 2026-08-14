variable "pg_host" {
default = "localhost"
}

variable "pg_port" {
default = 5522
}

variable "pg_admin_user" {
default = "postgres"

}

variable "pg_admin_password" {
  description = "PostgreSQL admin password"
  sensitive   = true
}

variable "db_name" {
  default = "terraformdb"
}

variable "app_user" {
  default = "appuser"
}

variable "app_password" {
  description = "Application user password"
  sensitive   = true
}
