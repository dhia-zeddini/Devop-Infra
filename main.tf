resource "docker_container" "container" {
  depends_on = [docker_network.network, docker_image.image, docker_volume.shared_volume]
  count      = 3  
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
    type   = "volume"
  }
}

resource "docker_container" "prometheus" {
  depends_on = [docker_network.network, docker_image.image]
  image      = docker_image.image[3].name
  name       = var.container_name[3]

  networks_advanced {
    name = docker_network.network.name
  }

  ports {
    internal = var.container_port[3]
    external = var.container_port[3]
  }

  mounts {
    source = "${abspath(path.module)}/prometheus.yml"
    target = "/etc/prometheus/prometheus.yml"
    type   = "bind"
  }
}

resource "docker_network" "network" {
  name = var.network_name
}

resource "docker_image" "image" {
  count        = 4  
  name         = var.image_name[count.index]
  keep_locally = true
}

resource "docker_volume" "shared_volume" {
  count = 3  
  name  = var.container_volumes[count.index]
}
