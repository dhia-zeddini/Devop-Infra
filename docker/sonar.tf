resource "docker_container" "sonarqube" {
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
