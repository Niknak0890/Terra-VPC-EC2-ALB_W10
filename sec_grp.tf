resource "aws_security_group" "sg1" {
    name = "Terraform-sg"
    description = "Allow ssh and httpd"
    vpc_id = aws_vpc.vpc1.id
    
    
    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        #cidr_blocks = ["0.0.0.0/0"]
            #limiting access to just the lb (below) via this port
        security_groups = [ aws_security_group.sg2.name ] 
            #allowing access to lb via sg2 (sg for load balancer)
    }

    ingress {
        description = "allow ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

        ingress {
        description = "allow http"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
    created-by-terraform = "yes"
  }

  
}

resource "aws_security_group" "sg2" {
    name = "Terraform-sg-lb"
    description = "Allow ssh and httpd"
    vpc_id = aws_vpc.vpc1.id

        ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
           #allowing public access to lb
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
  } 
}
