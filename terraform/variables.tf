variable "GRAFANA_URL" {
  type = string
}

variable "GRAFANA_AUTH" {
  description = "Grafana API token"
  type        = string
  sensitive   = true
}

variable "GRAFANA_INFLUX_TOKEN" {
  description = "InfluxDB token"
  type        = string
  sensitive   = true
}
