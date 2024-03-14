resource "grafana_dashboard" "test" {
  folder = grafana_folder.folder1.uid
  config_json = jsonencode({
    "title" : "My Dashboard",
    "uid" : "my-dashboard-uid"
  })
}
