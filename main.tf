terraform {  
  required_providers {     
    ibm = {       
      version = "~> 1.56"       
      source = "IBM-Cloud/ibm"    
    }  
  }
}
# Configure the IBM Provider
provider "ibm" {
  region           = "us-east"  
  ibmcloud_api_key = "bDJfsTemaRtEFz_3QP_o4qqYBnHqllu_Jqkpy-7PUMMm" 
}
# Configure the resource group
data "ibm_resource_group" "db_default" {
  is_default = true 
}
# Create database 
resource "ibm_database" "postgresql_db" {
  resource_group_id = data.ibm_resource_group.db_default.id
  name              = "test-postgresql" 
  service           = "databases-for-postgresql"
  plan              = "standard"
  location          = "us-east"
}

