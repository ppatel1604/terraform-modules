provider "azurerm" {
    features {
      
    }
}

module "simple_container_group" {
  source = "../../container_group"
  name = "simple-container-group"
  location = "westus3"
  resource_group_name = "sample-resource-group"
  containers = [
    {
      name   = "blackbox-exporter"
      image  = "prom/blackbox-exporter:latest"
      cpu    = "0.5"
      memory = "1.5"
      ports = [
        { port = 9115, protocol = "TCP" },
      ]
      volumes = []
    }
  ]
}