variable "image_name"{
    type = list(string)
}
variable "container_name"{
    type = list(string)
}
variable "container_volumes"{
    type = list(string)
}
variable "target_volumes"{
    type = list(string)
}
variable "container_port"{
    type = list(number)
}
variable "network_name"{
    type = string
}
