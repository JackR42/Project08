#Set of tags 

locals {
  tags = {
    created_by        = "Terraform"
    created_date      = var.TAG_CREATED_DATE
    deployment_region = var.LOCATION
    environment_type  = var.ENVTYPE
    businessUnit      = var.TAG_BUSINESS_UNIT
    applicationName   = var.ACTIVITY_TAG
  }
}
