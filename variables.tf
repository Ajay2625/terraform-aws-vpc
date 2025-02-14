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
        condition  = length(public_subnet_cidrs) == 2
        error_message = "please provide 2 public subnet cidrs"
    }
    
}