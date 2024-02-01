# portfolio

- [portfolio](#portfolio)
  - [Local development](#local-development)
  - [Deployment](#deployment)
    - [Frontend](#frontend)
    - [Infra (Terraform)](#infra-terraform)

<https://www.byambasuren.com/>

## Local development

```sh
cd frontend

npm run start
```

## Deployment

### Frontend

```sh
cd frontend
sh deploy.sh
```

### Infra (Terraform)

```sh
cd infra

# only first time.
terraform init

# validation
terraform fmt && terraform validate

# plan
terraform plan --out=tfplan

# apply
terraform apply "tfplan"
```
