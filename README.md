# IBM Cloud Automation

Shell scripts for routine IBM Cloud admin work with the `ibmcloud` CLI.

- `compute/` create a VSI, start or stop by tag, resize, snapshot for a custom image
- `storage/` Object Storage retention and backup, unattached volumes, old snapshots
- `networking/` VPC with subnet and public gateway, security groups open to the internet
- `databases/` list deployments, on-demand backup
- `identity-and-access/` old API keys, access group members
- `automation-runbooks/` Code Engine job on a cron schedule
- `monitoring-and-reporting/` VSI inventory CSV, account usage
- `resource-management/` untagged resources, CLI and plug-in setup

You need the IBM Cloud CLI with the `vpc-infrastructure`, `cloud-object-storage`, `code-engine` and `cloud-databases` plug-ins (`resource-management/Install-CLI-And-Plugins.sh` installs them) and `jq`. The Object Storage scripts also use the `aws` CLI against the S3-compatible endpoint, with HMAC keys in a profile called `ibmcos`.

Log in with `ibmcloud login --sso`, then `ibmcloud target -r us-south -g <resource-group>`. Destructive scripts only print what they would do unless `CONFIRM=yes`.

CLI flags change between releases, so check `ibmcloud <command> --help` if something errors. Not run against a live account yet.
