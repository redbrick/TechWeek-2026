job "techweek" {
  datacenters = ["aperture"]
  type        = "service"

  meta {
    git-sha = "[[.git_sha]]"
  }

  group "techweek-web" {
    count = 1

    network {
      port "http" {
        to = 80
      }
    }

    service {
      port = "http"

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }

      tags = [
        "traefik.enable=true",
        "traefik.http.routers.nginx-techweek.rule=Host(`techweek.redbrick.dcu.ie`) || Host(`techweek.dcu.ie`)",
        "traefik.http.routers.nginx-techweek.entrypoints=web,websecure",
        "traefik.http.routers.nginx-techweek.tls.certresolver=rb",
      ]
    }

    task "techweek-nginx" {
      driver = "docker"

      config {
        image      = "ghcr.io/redbrick/TechWeek-2026:latest"
        ports      = ["http"]
        force_pull = true
      }

      resources {
        cpu    = 100
        memory = 50
      }
    }
  }
}
