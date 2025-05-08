provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_handson_ec2" {
  ami           = "ami-085386e29e44dacd7" 
  instance_type = "t2.micro"
  key_name      = "devops-henadson" 

  vpc_security_group_ids = [aws_security_group.devops_handsOn_sg.id]

  tags = {
    Name = "devops-handson-ec2"
  }
}

resource "aws_security_group" "devops_handsOn_sg" {
  name        = "devops-handsOn-sg"
  description = "Allow SSH and React app port"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow React App"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
