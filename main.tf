resource "local_file" "universe" {
    filename =  var.filename2
    content = "Dear cosmic child, universe sings for you. The example of attribute reference is ${random_pet.my_pet.id}"
}

resource "local_file" "pet" {
    filename =  "/home/uniqosmos/Desktop/Terraform/Demo/pet.txt"
    content = data.local_file.dog.content
}

resource "local_file" "sample" {
    filename = var.sampleFile
    content =  var.content
}


resource "random_pet" "my_pet" {
    prefix =  var.prefix
    separator = var.separator
    length = var.length
}

data "local_file" "dog" {
    filename = "/home/uniqosmos/Desktop/Terraform/Demo/dogs.txt"
}

output pet-name {
    value = random_pet.my_pet.id
    description = "example of output variable"
}

