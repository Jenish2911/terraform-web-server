provider "aws" {
	region = "us-east-1"
}

resource "aws_security_group" "instance" {
	name = "terraform-example-instance"

	ingress {
		from_port = var.server_port
		to_port = var.server_port
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "example" {
	ami = "ami-04b70fa74e45c3917"
	instance_type = "t2.micro"
	vpc_security_group_ids = ["${aws_security_group.instance.id}"]

	user_data = <<-EOF
			#!/bin/bash
			echo "Hello, Jenish" > index.html
			nohup busybox httpd -f -p "${var.server_port}" & 
			EOF
}













