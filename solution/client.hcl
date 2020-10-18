log_level = "DEBUG"

data_dir = "/home/ec2-user/nomad-client-data"

name = "team1-client"

client {
  enabled = true
  servers = ["10.0.1.33:4647"]
}

ports {
  http = 5656
}
