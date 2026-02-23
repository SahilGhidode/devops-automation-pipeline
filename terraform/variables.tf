variable "ami_id" {
  description = "AMI ID for EC2 instance (Ubuntu 22.04)"
  default     = "ami-0f5ee92e2d63afc18"
}

variable "instance_type" {
  description = "Free tier eligible EC2 instance"
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  default     = "devops-automation-pipeline"
}