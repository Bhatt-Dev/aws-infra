remote_state_bucket = "bhattdev-tofu-remote-state-dev"

environment = "dev"

hosted_zone_name = "hub.bhattdev.in"

vpc_cidr             = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.0.0/18", "10.1.64.0/18"]
private_subnet_cidrs = ["10.1.128.0/19", "10.1.160.0/19"]