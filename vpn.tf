resource "aws_vpn_gateway" "vpngw_cliente" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = var.aws_vpc_name
  }
}

resource "aws_customer_gateway" "vpncg_cliente" {
  bgp_asn    = 65000
  ip_address = "189.22.10.114"
  type       = "ipsec.1"

  tags = {
    Name = var.aws_vpc_name
  }
}

resource "aws_vpn_connection" "vpnconn_cliente" {
  vpn_gateway_id      = aws_vpn_gateway.vpngw_cliente.id
  customer_gateway_id = aws_customer_gateway.vpncg_cliente.id
  type                = "ipsec.1"
  static_routes_only  = true
  tags = {
    "Name" = var.aws_vpc_name
  }
}

resource "aws_vpn_connection_route" "vpn_home" {
  destination_cidr_block = "10.253.0.0/23"
  vpn_connection_id      = aws_vpn_connection.vpnconn_cliente.id
}

resource "aws_vpn_connection_route" "rede_sede1" {
  destination_cidr_block = "172.22.0.0/16"
  vpn_connection_id      = aws_vpn_connection.vpnconn_cliente.id
}

resource "aws_vpn_connection_route" "rede_sede2" {
  destination_cidr_block = "172.23.0.0/16"
  vpn_connection_id      = aws_vpn_connection.vpnconn_cliente.id
}