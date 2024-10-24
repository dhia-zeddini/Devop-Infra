resource "docker_container" "nexus" {
  image = "nginx"
  name  = "nginx"
  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = 8085
    external = 8085
  }
}
