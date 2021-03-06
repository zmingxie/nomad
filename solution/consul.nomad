job "consul" {
  datacenters = ["dc1"]
  type = "service"

  group "consul" {
    count = 1

    task "consul" {
      driver = "exec"

      config {
        command = "consul"
        args    = ["agent", "-dev"]
      }

      artifact {
        source = "https://releases.hashicorp.com/consul/1.6.2/consul_1.6.2_linux_amd64.zip"
      }
    }
  }
}
