# main.tf

# Docker provider configuration
# provider "docker" {
#   host = "unix:///var/run/docker.sock"  # Using local Docker host
#     # registry_auth {
#     #     address  = "index.docker.io/v1/"
#     #     username = var.docker_username
#     #     password = var.docker_password
#     # }
# }

# Include the Terraform version requirement (optional)
# terraform {
#   required_version = ">= 1.0.0"
  
#   # Optional: Backend for storing the Terraform state remotely
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
# Create the Docker network
# module "network" {
#   source = "./docker/network"  # Path to your network module or configuration
# }


# # # SonarQube container
# module "sonarqube" {
#   source = "./docker/sonarqube"  # Path to your SonarQube module or configuration
# }

# # # Nexus container
# module "nexus" {
#   source = "./docker/nexus"  # Path to your Nexus module or configuration
# }
resource "docker_network" "app_network" {
  name = "app_network"
}

resource "docker_container" "hello-world" {
  image = "hello-world"
  name  = "hello-world"
  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = 9002
    external = 9002
  }
}
resource "docker_container" "nexus" {
  image = "nexus"
  name  = "test"
  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = 8085
    external = 8085
  }
}

# output "sonarqube_url" {
#   value = module.sonarqube.sonarqube_url
# }

# output "nexus_url" {
#   value = module.nexus.nexus_url
# }


