# IBM Cloud Automation

Readable shell scripts for everyday IBM Cloud administration with the `ibmcloud` CLI: virtual servers (VPC), block and object storage, networking, databases, access reviews, scheduling and reporting.

## Requirements

- [IBM Cloud CLI](https://cloud.ibm.com/docs/cli) with plug-ins `vpc-infrastructure`, `cloud-object-storage`, `code-engine`, `cloud-databases` (see `resource-management/Install-CLI-And-Plugins.sh`)
- `jq` for JSON handling
- `aws` CLI only for the Object Storage scripts, which use the S3-compatible API with HMAC credentials in an `ibmcos` profile
- Bash 4+ (Linux, macOS with GNU coreutils, or WSL)

Log in first: `ibmcloud login --sso` and `ibmcloud target -r us-south -g <resource-group>`.

## Layout

| Folder | Scripts |
|---|---|
| `compute/` | Create a VSI, start or stop by tag, resize, snapshot for a custom image |
| `storage/` | COS lifecycle retention, folder backup to COS, unattached volume report, old snapshot clean-up |
| `networking/` | VPC with subnet and public gateway, open security group audit |
| `databases/` | List deployments, on-demand backup |
| `identity-and-access/` | Old API keys, access group membership |
| `automation-runbooks/` | Cron-scheduled Code Engine job |
| `monitoring-and-reporting/` | VSI inventory to CSV, account usage |
| `resource-management/` | Untagged resource report, CLI setup |

## Notes

- Scripts take values from arguments or environment variables and never contain credentials. Destructive scripts default to a dry run.
- CLI flags change between releases. Run `ibmcloud <command> --help` if a command errors, and test in a non-production account first.
- Do not commit API keys, HMAC keys or account IDs. The `.gitignore` blocks common secret files.
