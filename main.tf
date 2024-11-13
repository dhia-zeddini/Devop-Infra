resource "docker_container" "container" {
  depends_on = [ docker_network.network ,docker_image.image ]
  count = 2
  image = docker_image.image.name[count.index]
  name  = var.container_name[count.index]
  networks_advanced {
    name = docker_network.network.name
  }
  ports {
    internal = var.container_port[count.index]
    external = var.container_port[count.index]
  }
}
resource "docker_network" "network" {
  name = var.network_name
}
resource "docker_image" "image" {
  count = 2
  name = var.image_name[count.index]
  keep_locally = true
}