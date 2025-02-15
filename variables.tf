variable "project_name" {

}

variable "environment" {

}
variable "vpc_cidr" {

}

variable "enable_dns_hostnames" {
    default = true
}

variable "common_tags" {
    type = map
    #default = {}
}

variable "public_subnet_cidrs" {
    type = list
    validation {
        condition  = length(var.public_subnet_cidrs) == 2
        error_message = "please provide 2 public subnet cidrs"
    }
    
}

variable "private_subnet_cidrs" {
    type = list
    validation {
        condition  = length(var.private_subnet_cidrs) == 2
        error_message = "please provide 2 public subnet cidrs"
    }
    
}

variable "database_subnet_cidrs" {
    type = list
    validation {
        condition  = length(var.database_subnet_cidrs) == 2
        error_message = "please provide 2 public subnet cidrs"
    }
    
}

variable "is_peering_required" {
    default = false
}