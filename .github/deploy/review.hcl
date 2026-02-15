job "techweek-review-[[.environment_slug]]" {
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
        "traefik.http.routers.techweek-[[.environment_slug]].rule=Host(`review-[[.environment_slug]].redbrick.dcu.ie`)",
        "traefik.http.routers.techweek-[[.environment_slug]].entrypoints=web,websecure",
        "traefik.http.routers.techweek-[[.environment_slug]].tls.certresolver=rb",
      ]
    }

    task "techweek-nginx-review" {
      driver = "docker"

      config {
        image      = "ghcr.io/redbrick/TechWeek-2026:sha-[[.git_sha]]"
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
