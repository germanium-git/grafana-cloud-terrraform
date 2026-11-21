# InfluxDB Cloud 2 (buckets and tokens managed in germanium-git/influxdb-cloud).
# All dashboards reference this data source by its fixed uid.
resource "grafana_data_source" "influxdb" {
  type               = "influxdb"
  uid                = "influxdb-cloud"
  name               = "influxdb-cloud"
  url                = "https://westeurope-1.azure.cloud2.influxdata.com"
  basic_auth_enabled = false
  is_default         = true

  json_data_encoded = jsonencode({
    defaultBucket = "Network"
    organization  = "15297d32235a99a0" # org ID
    httpMode      = "POST"
    timeout       = 10
    tlsSkipVerify = false
    version       = "Flux"
  })

  # Read-only "dashboards" token (Network + Temperature) from influxdb-cloud:
  #   terraform output -raw reader_token
  # After rotating it (README), a change under terraform/ is needed to deploy.
  secure_json_data_encoded = jsonencode({
    token = var.GRAFANA_INFLUX_TOKEN
  })
}
