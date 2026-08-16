pg_admin_password = "Postgres"

app_password      = "AppUser123"

variable "databases" {
type = map(object({
users = map(string)
}))

default = {
  appdb = {
   users = {
    appuser = "appuser1"
    appreadonly = "Appread@123"
    sathish = "root123"
  }
}
  testdb = {
   users = {
    testuser = "testuser"
    testreadonly = "Testread@123"
  }
}
  devdb = {
    username = "devuser"
    password = "Dev@123"
  }
}
}

