data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
data "aws_s3_bucket" "east1-bucket-us" {
  bucket = var.ep_bucket_east1
}
# Step 3: Adicionando Resource Block
resource "aws_s3_bucket" "east1-bucket-us" {
  bucket        = var.ep_bucket_east1
  force_destroy = true

  tags = {
    Name        = "EliezerPires bucket us-east-1"
    Environment = "Dev"
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name       = "HelloWorld"
    Plataforma = data.aws_ami.ubuntu.platform_details
  }
}