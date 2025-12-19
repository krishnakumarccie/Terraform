
# Key Pair Creation
resource "aws_key_pair" "ec2-ssh-key" {
  key_name   = "${var.env_module}-ssh-key"
  public_key = file("ssh-key.pub")
  tags = {
    Environment = var.env_module
  }
}

# VPC Creation

resource "aws_vpc" "Test-Vpc" {
  cidr_block = "20.0.0.0/16"
}

# Subnet Creation
resource "aws_subnet" "Test_subnet1" {
  vpc_id            = aws_vpc.Test-Vpc.id
  cidr_block        = "20.0.1.0/24"
  availability_zone = "eu-north-1a"
}

resource "aws_subnet" "Test_subnet2" {
  vpc_id            = aws_vpc.Test-Vpc.id
  cidr_block        = "20.0.2.0/24"
  availability_zone = "eu-north-1b"
}

# Internet gateway Creation
resource "aws_internet_gateway" "aws_ig" {
  vpc_id = aws_vpc.Test-Vpc.id

  tags = {
    Name = "igw"
  }
}

# Route Table Creation

resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.Test-Vpc.id
  tags = {
    Name = "public-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_ig.id
  }
}

resource "aws_route_table" "Private_RT" {
  vpc_id = aws_vpc.Test-Vpc.id
  tags = {
    Name = "private-rt"
  }
}

# Subnet Route Table Association:
resource "aws_route_table_association" "test-PubRT-Subnet-association" {
  subnet_id      = aws_subnet.Test_subnet1.id
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_route_table_association" "test-PrivRT-Subnet-association" {
  subnet_id      = aws_subnet.Test_subnet2.id
  route_table_id = aws_route_table.Private_RT.id
}

# Security Group Creation
resource "aws_security_group" "Test_SG" {
  name   = "${var.env_module}-security_group"
  vpc_id = aws_vpc.Test-Vpc.id
  tags = {
    Name = "${var.env_module}-security_group"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["80.2.17.115/32"]
  }
}


# Ec2 Instance creation
resource "aws_instance" "test_instance" {
  count = var.instance_count
  availability_zone           = "eu-north-1a"
  instance_type               = var.instance_type
  ami                         = var.ec2_ami_module
  key_name                    = aws_key_pair.ec2-ssh-key.key_name
  subnet_id                   = aws_subnet.Test_subnet1.id
  vpc_security_group_ids = [aws_security_group.Test_SG.id]
  associate_public_ip_address = var.public_ip_association_module

  root_block_device {
    volume_size = var.env_module == "prod" ? 20 : 30
    volume_type = "gp3"
  
  }
  tags = {
    Name = "${var.env_module}-module-vm"
    Environment = var.env_module
  }
}
