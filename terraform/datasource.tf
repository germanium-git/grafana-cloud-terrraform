resource "grafana_data_source" "influxdb" {
  type               = "influxdb"
  name               = "influxdb-apollo-terraform"
  url                = "https://apollo.germanium.cz:8086"
  basic_auth_enabled = false
  is_default         = false


  json_data_encoded = jsonencode({
    defaultBucket = "Network"
    organization  = "Germanium"
    timeout       = 10
    tlsSkipVerify = true
    version       = "Flux"
  })

  secure_json_data_encoded = jsonencode({
    token = var.GRAFANA_INFLUX_TOKEN
  })
}
