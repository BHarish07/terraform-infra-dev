variable "project_name" {
  default = "expense"
}
variable "environment" {
  default = "dev"
}

variable "db_sg_description" {
  default = "SG for DB MySQL Instances"
}

variable "backend_sg_description" {
  default = "SG for backend Instances"
}
variable "frontend_sg_description" {
  default = "SG for frontend Instances"
}

variable "bastion_sg_description" {
  default = "SG for bastion Instances"
}

variable "vpn_sg_description" {
  default = "SG for VPN"
}
variable "app_alb_sg_description" {
  default = "SG for APP Load Balancer"
}
variable "common_tags" {
    default = {
          Project = "Expense"
          Environment = "Dev"
          Teraform = true
    }
  }

  variable "vpn_sg_rules" {
    default = [
      {
        from_port = 443
        to_port   = 443
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port = 943
        to_port   = 943
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port = 1194
        to_port   = 1194
        protocol  = "udp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }


