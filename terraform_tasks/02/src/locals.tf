locals {

  vm_names = [
    {
      platform = ["${var.vm_web_name_of_vm}"]
    },
    {
      platform-b = ["${var.vm_db_name_of_vm}"]
    }
  ]
}