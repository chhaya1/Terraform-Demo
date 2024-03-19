variable "filename2" {
    default = "/home/uniqosmos/Desktop/Terraform/Demo/cosmos.txt"
}
variable "filename" {
    type = set(string)
    default = ["/home/uniqosmos/Desktop/Terraform/Demo/cosmos.txt","/home/uniqosmos/Desktop/Terraform/Demo/pet.txt"]
}
variable "prefix" {
    default = "Miss"
}
variable "separator" {
    default = "."
}
variable "length" {
    default = "3"
}
variable "sampleFile" {
    default = "/home/uniqosmos/Desktop/Terraform/Demo/sample.txt"
}
variable "content" {
    default = "sammple file"
}


