# nginx-server

### Overview
This Terraform configuration creates a VPC with 3 public subnets, 3 private subnets, an Internet Gateway, a Security Group, and an EC2 instance running NGINX.

### Deployment Steps (Prerequisites)
###### Install Terraform
Have an AWS account with credentials configured.
Your own Key pair created from AWS.

### Clone Repository
Create a repo from Github.
git clone the repo on your terminal
cd into your repo for continuous coding.

### Run the following command to see the proposed changes: To apply the changes and create the resources.

```
terraform init
terraform plan
terraform apply

```

### File Structure

```

├── main.tf                 # Main configuration file that calls the module
├── provider.tf             # AWS provider configuration
├── variable.tf             # Defines variables to be used across the configurationat
├── nginx-userdata.sh       # Bash script to install Nginx on the server
├── modules/
│   ├── compute             # Compute folders containing the maint.tf and variable.tf files
│   ├── network             # Network folders containing the MOV files - maint.tf, output.tf and variable.tf files 
│   ├── security            # Security folders containing the MOV files - maint.tf, output.tf and variable.tf files 
│__.gitignore              # Specifies files to ignore by git during commit process.

```

### Resources Created

VPC (10.0.0.0/16)
Public Subnets (10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24)
Private Subnets (10.0.4.0/24, 10.0.5.0/24, 10.0.6.0/24)
Availability zonez (eu-west-2a, eu-west-2b, eu-west-2c)
Internet Gateway for internet access
Route Table with routes to the Internet Gateway
Security Group allowing SSH (22) and HTTP (80)
EC2 Instance (t2.micro) running NGINX
