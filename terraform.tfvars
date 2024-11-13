image_name = [
  "sonatype/nexus3:3.39.0",  
  "sonarqube",                 
  "grafana/grafana",         
  "prom/prometheus"        
]

container_name = [
  "nexus",
  "sonarqube",
  "grafana",
  "prometheus"
]
container_volumes = [
  "nexus-data",
  "sonarqube-data",
  "grafana-data",
  "prometheus-data"
]
target_volumes = [
  "/nexus-data",
  "/opt/sonarqube/data",
  "/var/lib/grafana",
  "/prometheus"
]

container_port = [
  8081,  
  9000,  
  3000,  
  9090   
]
network_name = "my-network"