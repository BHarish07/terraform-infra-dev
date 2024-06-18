variable "project_name" {
  default = "expense"
}
variable "environment" {
  default = "dev"
}


variable "common_tags" {
    default = {
          Project = "Expense"
          Environment = "Dev"
          Teraform = true
          Component = "acm"
    }
  }

variable "zone_name" {
   default = "harishbalike.online"  
}

variable "zone_id" {
  default = "Z05565782P7G8564J8J8E"
}