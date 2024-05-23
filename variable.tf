variable "ENVIRONMENT" {
  description = "The environment for deployment"
  type        = string
  default     = "dev"
}

variable "REGION" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "INSTANCE_TYPE" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.medium"
}