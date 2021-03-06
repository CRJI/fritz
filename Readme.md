# liquiddemo.org deployment

Deploy on fritz using [Terraform].

[Terraform]: https://www.terraform.io/


## HowTo
First read through the Terraform [Build Infrastructure tutorial] if you're new
to Terraform.

[Install Terraform], then run `terraform init` to download plugins.

```
$ terraform init
[...]
Terraform has been successfully initialized!
```

Terraform state is persisted in the cluster's consul so it's synchronized for
all users of this repo.

Make changes to the configuration files then run `terraform apply` to deploy.

```
$ terraform apply
nomad_job.vmck: Refreshing state... [id=vmck]

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

[Build Infrastructure tutorial]: https://learn.hashicorp.com/terraform/getting-started/build
[Install Terraform]: https://www.terraform.io/downloads.html
