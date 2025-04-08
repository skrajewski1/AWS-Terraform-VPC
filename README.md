# AWS VPC with ALB and EC2 using Terraform

This project deploys a scalable and secure AWS infrastructure using Terraform, featuring a Virtual Private Cloud (VPC), an Application Load Balancer (ALB), and EC2 instances. It’s a hands-on demonstration of Infrastructure-as-Code (IaC) principles, built to explore cloud networking, load balancing, and automation with modern DevOps tools.

## Features
- **Custom VPC**: A VPC with public and private subnets across multiple availability zones for high availability.
- **Application Load Balancer**: An ALB to distribute traffic to EC2 instances, with HTTP listener rules.
- **EC2 Instances**: Auto-scaled instances in private subnets, accessible via the ALB.
- **Networking**: Internet Gateway, NAT Gateways, and route tables for public/private subnet connectivity.
- **Security**: Security groups to control traffic (e.g., HTTP/HTTPS to ALB, SSH restricted).

## Tech Stack
- **Terraform**: Infrastructure provisioning and management.
- **AWS**: Cloud provider (VPC, EC2, ALB, etc.).
- **HCL**: Terraform’s configuration language.

## Architecture
![Architecture Diagram](https://via.placeholder.com/600x300.png?text=Architecture+Diagram)  

- **Public Subnets**: Host the ALB and NAT Gateways for outbound traffic.
- **Private Subnets**: Host EC2 instances, isolated from direct internet access.
- **ALB**: Routes incoming traffic to EC2 targets across AZs.

## Prerequisites
- AWS account with IAM credentials (Access Key and Secret Key).
- Terraform installed locally (v1.5.0 or later recommended).
- AWS CLI configured (optional, for verification).

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/skrajewski1/dev-terraform-ec2-alb-vpc.git
   cd dev-terraform-ec2-alb-vpc
   ```

---

# Terraform AWS Infrastructure Deployment

## Initialize Terraform:
```bash
terraform init
```

## Configure Variables:
Edit `terraform.tfvars` or pass variables via CLI (e.g., `-var "aws_region=us-east-1"`).

### Example `terraform.tfvars`:
```hcl
aws_region     = "us-east-1"
vpc_cidr       = "10.0.0.0/16"
instance_type  = "t2.micro"
```

## Deploy the Infrastructure:
```bash
terraform apply
```
Review the plan and type `yes` to confirm.

## Access the ALB:
After deployment, find the ALB DNS name in the Terraform output or AWS Console.  
Visit `http://<alb-dns-name>` in a browser (if a web server is configured on EC2).

## Cleanup:
```bash
terraform destroy
```

## Outputs:
- **alb_dns_name**: The DNS name of the Application Load Balancer.
- **ec2_instance_ids**: List of deployed EC2 instance IDs.

## Usage:
This setup provisions a basic load-balanced infrastructure. To make it functional:
- Add a `user_data` script in `ec2.tf` to install a web server (e.g., Nginx) on the EC2 instances.
- Test the ALB by hitting its DNS name and verifying traffic reaches the instances.

## Why This Project?
I built this as a learning exercise to deepen my understanding of AWS networking, Terraform automation, and DevOps practices. It showcases my ability to design and deploy cloud infrastructure programmatically, a skill I’m excited to apply in real-world environments.
