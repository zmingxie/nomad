job "frontend" {
  datacenters = ["dc1"]
  type = "service"

  group "frontend" {
    scaling {
      enabled = true
      min = 5
      max = 10
      policy = {}
    }

    update {
      max_parallel = 1
      min_healthy_time = "5s"
      healthy_deadline = "30s"
      auto_revert = false
      auto_promote = false
      canary = 1
    }

    task "frontend" {
      driver = "docker"

      config {
        image = "thedojoseries/frontend:2.0"
      }

      env {
        PORT = "${NOMAD_PORT_http}"
      }

      resources {
        network {
          port "http" { }
        }
      }

      service {
        name = "frontend"
        port = "http"

        tags = [
          "frontend",
          "urlprefix-/"
        ]

        check {
          type = "http"
          path = "/"
          interval = "5s"
          timeout = "2s"
        }
      }
    }
  }
}
