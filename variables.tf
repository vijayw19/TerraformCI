variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {
    rg1 = {
      name     = "rg-development-m"
      location = "East US"
      tags = {
        enviornment = "dev-m"
        BU          = "learning"
      }
    }

    rg2 = {
      name     = "rg-staging-m"
      location = "East US"
      tags = {
        enviornment = "stg-m"
        BU          = "learning"
      }
    }
  }

}