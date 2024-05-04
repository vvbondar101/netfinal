resource "yandex_vpc_network" "finalvpc" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "finalnet" {
  name           = var.final01net
  zone           = var.zone1a
  network_id     = yandex_vpc_network.finalvpc.id
  v4_cidr_blocks = var.final_cidr
}



