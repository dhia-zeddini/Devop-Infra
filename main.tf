resource "docker_container" "container" {
  depends_on = [docker_network.network, docker_image.image,docker_volume.shared_volume]
  count      = 4  
  image      = docker_image.image[count.index].name
  name       = var.container_name[count.index]

  networks_advanced {
    name = docker_network.network.name
  }

  ports {
    internal = var.container_port[count.index]
    external = var.container_port[count.index]
  }
 mounts {
   source = docker_volume.shared_volume[count.index].name
   target = var.target_volumes[count.index]
   type = "volume"
 }
}

resource "docker_network" "network" {
  name = var.network_name
}

resource "docker_image" "image" {
  count = 4  
  name  = var.image_name[count.index]
  keep_locally = true
}
resource "docker_volume" "shared_volume" {
  count = 4  
  name = var.container_volumes[count.index]
  lifecycle {
    prevent_destroy = true
  }
}