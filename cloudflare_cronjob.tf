resource "kubernetes_secret_v1" "cloudflare_dyndns_secret" {
  metadata {
    name      = "cloudflare-dyndns"
    namespace = "default"
  }

  data = {
    ".env" = <<EOF
      AUTH_KEY="${var.cloudflare_api_token}"
      dnsrecord1=${var.cloudflare_dnsrecord[0]}
      dnsrecord2=${var.cloudflare_dnsrecord[1]}
      dnsrecords=("dnsrecord1" "dnsrecord2")
      DNS_ZONE_ID=${var.cloudflare_dns_zone_id}
      EOF
  }

  type = "Opaque"
}

resource "kubernetes_config_map_v1" "cloudflare_dyndns_script" {
  metadata {
    name      = "cloudflare-dyndns"
    namespace = "default"
  }

  data = {
    "cloudflare_dyndns_script.sh" = <<EOF
      #!/bin/bash

      source /env/.env
      while [ -z "$CURRENT_IP_ADDRESS" ]
      do
        CURRENT_IP_ADDRESS=$(curl -s ip.me)
        echo "CURRENT_IP_ADDRESS:" $CURRENT_IP_ADDRESS
      done
      for record in "$${dnsrecords[@]}"
      do
        declare -n array="$record"
        unset CURRENT_DNS_VALUE
        while [ -z "$CURRENT_DNS_VALUE" ]
        do
          CURRENT_DNS_VALUE=$(curl -sX GET "https://api.cloudflare.com/client/v4/zones/$${DNS_ZONE_ID}/dns_records/$${array[1]}" -H "Content-Type:application/json" -H "Authorization: Bearer $${AUTH_KEY}" | jq -r .result.content)
          echo "CURRENT_DNS_VALUE:" $CURRENT_DNS_VALUE
        done
        if [ $${CURRENT_DNS_VALUE} != $${CURRENT_IP_ADDRESS} ]
        then
          echo "DNS_RECORD_NAME:" $${array[0]}
          echo "DNS_RECORD_ID:" $${array[1]}
        	curl -sX PUT "https://api.cloudflare.com/client/v4/zones/$${DNS_ZONE_ID}/dns_records/$${array[1]}" -H "Authorization: Bearer $${AUTH_KEY}" -H "Content-Type:application/json" --data '{"type":"A","name":'\"$${array[0]}'","content":'\"$${CURRENT_IP_ADDRESS}'"}' > /dev/null
        fi
        (echo OK && exit 0) || (echo ERROR && exit 1)
      done
      EOF
  }
}

resource "kubernetes_cron_job_v1" "cloudflare_dyndns_cronjob" {
  metadata {
    name      = "cloudflare-dyndns"
    namespace = "default"
  }
  spec {
    concurrency_policy            = "Replace"
    failed_jobs_history_limit     = 5
    schedule                      = "@hourly"
    starting_deadline_seconds     = 10
    successful_jobs_history_limit = 0
    job_template {
      metadata {}
      spec {
        backoff_limit              = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {}
          spec {
            container {
              command = [
                "/usr/local/bin/bash",
                "-c",
              "apk add --update curl jq &>/dev/null && /script/cloudflare_dyndns_script.sh"]
              # "apk add --update curl jq &>/dev/null && while [ -z \"$CURRENT_IP_ADDRESS\" ]; do CURRENT_IP_ADDRESS=$(curl -s ip.me); done && for DNS_RECORD in \"$${DNS_RECORDS[@]}\"; do IFS=\";\" read -r -a arr <<< \"$${DNS_RECORD}\" while [ -z \"$CURRENT_DNS_VALUE\" ]; do CURRENT_DNS_VALUE=$(curl -sX GET \"https://api.cloudflare.com/client/v4/zones/$${DNS_ZONE_ID}/dns_records/$${arr[1]}\" -H \"Content-Type:application/json\" -H \"Authorization: Bearer $${AUTH_KEY}\" | jq -r .result.content); done && if [ $${CURRENT_DNS_VALUE} != $${CURRENT_IP_ADDRESS} ] ; then curl -sX PUT \"https://api.cloudflare.com/client/v4/zones/$${DNS_ZONE_ID}/dns_records/$${arr[1]}\" -H \"Authorization: Bearer $${AUTH_KEY}\" -H \"Content-Type:application/json\" --data '{\"type\":\"A\",\"name\":'\\\"$${arr[0]}'\",\"content\":'\\\"$${CURRENT_IP_ADDRESS}'\"}' > /dev/null; fi && (echo OK && exit 0) || (echo ERROR && exit 1); done" ]
              # "apk add --update curl jq &>/dev/null && while [ -z \"$CURRENT_IP_ADDRESS\" ]; do CURRENT_IP_ADDRESS=$(curl -s ip.me); done && while [ -z \"$CURRENT_DNS_VALUE\" ]; do CURRENT_DNS_VALUE=$(curl -sX GET \"https://api.cloudflare.com/client/v4/zones/$${DNS_ZONE_ID}/dns_records/$${DNS_RECORD_ID}\" -H \"Content-Type:application/json\" -H \"Authorization: Bearer $${AUTH_KEY}\" | jq -r .result.content); done && if [ $${CURRENT_DNS_VALUE} != $${CURRENT_IP_ADDRESS} ] ; then curl -sX PUT \"https://api.cloudflare.com/client/v4/zones/$${DNS_ZONE_ID}/dns_records/$${DNS_RECORD_ID}\" -H \"Authorization: Bearer $${AUTH_KEY}\" -H \"Content-Type:application/json\" --data '{\"type\":\"A\",\"name\":'\\\"$${DNS_RECORD_NAME}'\",\"content\":'\\\"$${CURRENT_IP_ADDRESS}'\"}' > /dev/null; fi && (echo OK && exit 0) || (echo ERROR && exit 1)" ]
              image             = "bash:latest"
              image_pull_policy = "IfNotPresent"
              name              = "cloudflare-dyndns"
              volume_mount {
                mount_path = "/script"
                name       = "cloudflare-dyndns-script"
              }
              volume_mount {
                mount_path = "/env"
                name       = "cloudflare-dyndns-env"
              }
              # env_from {
              #   secret_ref {
              #     name = "cloudflare-dyndns"
              #   }
              # }
              # env {
              #   name = "AUTH_KEY"
              #   value_from {
              #     secret_key_ref {
              #       key = "AUTH_KEY"
              #       name = "cloudflare-dyndns"
              #     }
              #   }
              # }
              # env {
              #   name = "DNS_RECORDS"
              #   value_from {
              #     secret_key_ref {
              #       key = "DNS_RECORDS"
              #       name = "cloudflare-dyndns"
              #     }
              #   }
              # }
              # env {
              #   name = "DNS_RECORD_ID"
              #   value_from {
              #     secret_key_ref {
              #       key = "DNS_RECORD_ID"
              #       name = "cloudflare-dyndns"
              #     }
              #   }
              # }
              # env {
              #   name = "DNS_ZONE_ID"
              #   value_from {
              #     secret_key_ref {
              #       key = "DNS_ZONE_ID"
              #       name = "cloudflare-dyndns"
              #     }
              #   }
              # }
            }
            volume {
              name = "cloudflare-dyndns-script"
              config_map {
                default_mode = "0777"
                name         = "cloudflare-dyndns"
              }
            }
            volume {
              name = "cloudflare-dyndns-env"
              secret {
                default_mode = "0644"
                secret_name  = "cloudflare-dyndns"
              }
            }
            restart_policy = "OnFailure"
          }
        }
      }
    }
  }
}
