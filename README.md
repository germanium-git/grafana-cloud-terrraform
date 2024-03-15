# grafana-cloud-terrraform
Grafana Cloud managed by Terraform

## Secrets

| GH secret  | TF variable  | Description  |
|---|---|---|
| TF_GRAFANA_AUTH | GRAFANA_AUTH | Grafana Cloud Service account |
| TF_TFCLOUD_TOKEN | TFCLOUD_TOKEN | Terraform Cloud API token |
| GH_TOKEN | N/A (used by GH action to push commets to PR) |  GH Organization > Developers Settings > Personal Access Tokens > grafana_cloud GH Action |

Note: There is another secret called GITHUB_TOKEN that is generetaed automatically by GH Action and whose permission is set by Settings > Actions > Workflow permissions.
```
Choose the default permissions granted to the GITHUB_TOKEN when running workflows in this repository. You can specify more granular permissions in the workflow using YAML
```


## Variables

| GH variable  | TF variable  | Description  |
|---|---|---|
| TF_GRAFANA_URL | GRAFANA_URL  | grafana09ca.grafana.net  |


## Permission

To manage resources in the Grafana Cloud by Terraform a Service account needs to be created.

Go to *Grafana Home > Administration > Users and access > Service accounts*

and store the token in GH Secrets as TF_GRAFANA_AUTH.

## Issues


To get rid of the `Error: Saving a generated plan is currently not supported!` configure TF Cloud workspace to only save the state file.

mygermanium > Projects & workspaces > grafana-cloud > Settings > General Settings > Execution Mode > Local

*Your plans and applies occur on machines you control. Terraform Cloud is only used to store and synchronize state.*