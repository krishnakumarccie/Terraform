
# Prod Environment
module "prod-infra" {
  source = "./infra"
  env_module = "prod"
  bucket_name = "krishnas3bucket-module"
  instance_count = 1
  instance_type = "t3.micro"
  ec2_ami_module = "ami-0b46816ffa1234887" #Amazon Linux
  hash_key = "abcd"
  ssh_key = "ssh-key.pub"
}

# Dev Environment
module "dev-infra" {
  source = "./infra"
  env_module = "dev"
  bucket_name = "krishnas3bucket-module"
  instance_count = 2
  instance_type = "t3.small"
  ec2_ami_module = "ami-08526b399bb6eb2c7" #Redhat Linux10
  hash_key = "abcd"
  ssh_key = "ssh-key.pub"
}

# DR Environment
module "dr-infra" {
  source = "./infra"
  env_module = "dr"
  bucket_name = "krishnas3bucket-module"
  instance_count = 2
  instance_type = "t3.micro"
  ec2_ami_module = "ami-02d780a7b1609ebca" #Windows 2025
  hash_key = "abcd"
  ssh_key = "ssh-key.pub"
}
