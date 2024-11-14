image_name = [
  "sonatype/nexus3:3.39.0",  
  "sonarqube:9.9.1-community",                 
  "grafana/grafana",         
]

container_name = [
  "nexus",
  "sonarqube",
  "grafana",
]
container_volumes = [
  "nexus-data",
  "sonarqube-data",
  "grafana-data",
]
target_volumes = [
  "/nexus-data",
  "/opt/sonarqube/data",
  "/var/lib/grafana",
]

container_port = [
  8081,  
  9000,  
  3000,  
]
network_name = "my-network"