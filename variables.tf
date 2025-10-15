variable "instance_name" {
  type        = string
  description = "The name of the instance."
  default     = "new_instance"
}

variable "username" {
  type        = string
  description = "The name of the user."
  default     = "demo-user"
}

variable "region" {
  type        = string
  description = "The region the instance will sit in."
  default     = "europe-west1"
}

variable "database_version" {
  type        = string
  description = "The MySQL or PostgreSQL version to use."
  default     = "MYSQL_5_7"
}

variable "project_name" {
  type        = string
  description = "project name"
  default     = "school-terraform-oct25-sbx"
}

