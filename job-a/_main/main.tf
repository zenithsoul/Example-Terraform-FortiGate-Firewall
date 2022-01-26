terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
      version = "1.13.2"
    }
  }
}

provider "fortios" {
  # Configuration options
  alias="hq"
  hostname="192.168.250.150:18080"
  token="sdQ9bwQp19Gz7G13t8btHQf9rxwny3"
  insecure="true"
}

provider "fortios" {
  # Configuration options
  alias="west"
  hostname="192.168.250.150:18081"
  token="tpQpzttwky50bbkHj51Hk33wrHk5j1"
  insecure="true"
}

provider "fortios" {
  # Configuration options
  alias="east"
  hostname="192.168.250.150:18082"
  token="z73m4N9NN5dx7G0zrfcnQz4fs5k8g4"
  insecure="true"
}

module "hq" {
  source    = "../hq"
  providers = {
    fortios = fortios.hq
  }
}

module "east" {
  source    = "../east"
  providers = {
    fortios = fortios.east
  }
}

module "west" {
  source    = "../west"
  providers = {
    fortios = fortios.west
  }
}