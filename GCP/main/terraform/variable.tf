variable "region" {
    description = "The project region"
    default     = "us-central1"
}
variable "gcp_project" {
    description  = "The project ID"
    default      = "mynewproject-247215"
}
variable "credentials" {
#    default      = "mynewproject-247215-c45dd8fc1e27.json" 
    default      = "mygcp.json"
}
variable "name" {
    default      = "dev"
}
variable "subnet_cidr" {
    default      = "10.10.0.0/24"
}
variable "central1_private_subnet" {
    default      = "10.26.1.0/24"
}
variable "central1_public_subnet" {
    default      = "10.26.2.0/24"
}
