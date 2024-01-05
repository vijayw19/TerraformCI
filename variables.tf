variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {
    rg1 = {
      name     = "rg-development"
      location = "East US"
      tags = {
        enviornment = "dev"
        BU          = "learning"
      }
    }
  }
}
variable "storage_account_name" {
  type    = list(string)
  default = ["amvidevstgaccount", "amvisitstgaccount"]

}
