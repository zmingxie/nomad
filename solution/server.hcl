log_level = "DEBUG"

data_dir = "/home/ec2-user/nomad-server-data"

server {
  enabled = true
  bootstrap_expect = 1
}

advertise {
  http = "0.0.0.0"
}
