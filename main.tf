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
  ibmcloud_api_key = "3a0VNgHF2MJFzSuwUlEWiqZui18r9teiB9lVsDrFfyfi" 
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

