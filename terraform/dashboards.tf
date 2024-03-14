resource "grafana_dashboard" "test1" {
  folder = grafana_folder.folder1.uid
  config_json = jsonencode({
    "title" : "Test Dashboard 1",
    "uid" : "test-dashboard-1-uid"
  })
}

resource "grafana_dashboard" "test2" {
  folder = grafana_folder.folder1.uid
  config_json = jsonencode({
    "title" : "Test Dashboard 2",
    "uid" : "test-dashboard-2-uid"
  })
}
