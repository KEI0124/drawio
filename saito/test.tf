resource "aws_route_table" "RTB-CNT-GLO" {
  vpc_id = aws_vpc.VPC-CNT.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-CNT.id
  }

  tags = {
    Name   = var.route_table_name.cnt-glo
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-CNT-GLO-0" {
  subnet_id      = aws_subnet.SUB-CNT-GLO-0.id
  route_table_id = aws_route_table.RTB-CNT-GLO.id
}

resource "aws_route_table_association" "RTB-ASS-CNT-GLO-1" {
  subnet_id      = aws_subnet.SUB-CNT-GLO-1.id
  route_table_id = aws_route_table.RTB-CNT-GLO.id
}

resource "aws_route_table" "RTB-CNT-GLM" {
  vpc_id = aws_vpc.VPC-CNT.id
  /*
  route {
    cidr_block = var.ext_ip_cidr.scsk-proxy-big-ip
    gateway_id = aws_internet_gateway.IGW-CNT.id
  }
*/
  route {
    cidr_block = var.ext_ip_cidr.satt
    gateway_id = aws_internet_gateway.IGW-CNT.id
  }
  /*
  route {
    cidr_block = var.ext_ip_cidr.scsk-infra
    gateway_id = aws_internet_gateway.IGW-CNT.id
  }

  route {
    cidr_block = var.ext_ip_cidr.scsk-app
    gateway_id = aws_internet_gateway.IGW-CNT.id
  }

  route {
    cidr_block = var.ext_ip_cidr.crosshead-big-ip
    gateway_id = aws_internet_gateway.IGW-CNT.id
  }
*/
  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  tags = {
    Name   = var.route_table_name.cnt-glm
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-CNT-GLM-0" {
  subnet_id      = aws_subnet.SUB-CNT-GLM-0.id
  route_table_id = aws_route_table.RTB-CNT-GLM.id
}

resource "aws_route_table_association" "RTB-ASS-CNT-GLM-1" {
  subnet_id      = aws_subnet.SUB-CNT-GLM-1.id
  route_table_id = aws_route_table.RTB-CNT-GLM.id
}

resource "aws_route_table" "RTB-CNT-WEB" {
  vpc_id = aws_vpc.VPC-CNT.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW-CNT.id
  }

  #route {
  #  cidr_block                = var.subnet_cidr.int-iap-0
  #  vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Cnt.id
  #}

  #route {
  #  cidr_block                = var.subnet_cidr.int-iap-1
  #  vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Cnt.id
  #}

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-slb-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-slb-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  tags = {
    Name   = var.route_table_name.cnt-web
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-CNT-WEB-0" {
  subnet_id      = aws_subnet.SUB-CNT-WEB-0.id
  route_table_id = aws_route_table.RTB-CNT-WEB.id
}

resource "aws_route_table_association" "RTB-ASS-CNT-WEB-1" {
  subnet_id      = aws_subnet.SUB-CNT-WEB-1.id
  route_table_id = aws_route_table.RTB-CNT-WEB.id
}

resource "aws_route_table" "RTB-RST-WAP" {
  vpc_id = aws_vpc.VPC-RST.id

  route {
    cidr_block = var.vgw_cidr.rst-wap-01
    gateway_id = aws_vpn_gateway.VGW-RST.id
  }

  route {
    cidr_block = var.vgw_cidr.rst-wap-02
    gateway_id = aws_vpn_gateway.VGW-RST.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-web-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-web-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  tags = {
    Name   = var.route_table_name.rst-wap
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

# resource "aws_route_table_association" "RTB-ASS-RST-WAP-0" {
#   subnet_id      = aws_subnet.SUB-RST-WAP-0.id
#   route_table_id = aws_route_table.RTB-RST-WAP.id
# }

# resource "aws_route_table_association" "RTB-ASS-RST-WAP-1" {
#   subnet_id      = aws_subnet.SUB-RST-WAP-1.id
#   route_table_id = aws_route_table.RTB-RST-WAP.id
# }

resource "aws_route_table" "RTB-RST-CHK" {
  vpc_id = aws_vpc.VPC-RST.id

  tags = {
    Name   = var.route_table_name.rst-chk
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-RST-CHK-0" {
  subnet_id      = aws_subnet.SUB-RST-CHK-0.id
  route_table_id = aws_route_table.RTB-RST-CHK.id
}

resource "aws_route_table_association" "RTB-ASS-RST-CHK-1" {
  subnet_id      = aws_subnet.SUB-RST-CHK-1.id
  route_table_id = aws_route_table.RTB-RST-CHK.id
}

#resource "aws_route_table" "RTB-RST-CHK2" {
#  vpc_id = aws_vpc.VPC-RST.id
#
#  tags = {
#    Name   = var.route_table_name.rst-chk2
#    System = var.tags.System
#    Cost   = var.tags.Cost
#    Env    = var.tags.Env
#  }
#}

#resource "aws_route_table_association" "RTB-ASS-RST-CHK2-0" {
#  subnet_id      = aws_subnet.SUB-RST-CHK2-0.id
#  route_table_id = aws_route_table.RTB-RST-CHK2.id
#}

#resource "aws_route_table_association" "RTB-ASS-RST-CHK2-1" {
#  subnet_id      = aws_subnet.SUB-RST-CHK2-1.id
#  route_table_id = aws_route_table.RTB-RST-CHK2.id
#}

resource "aws_route_table" "RTB-RST-WDB" {
  vpc_id = aws_vpc.VPC-RST.id

  route {
    cidr_block = var.vgw_cidr.rst-wdb-01
    gateway_id = aws_vpn_gateway.VGW-RST.id
  }

  route {
    cidr_block = var.vgw_cidr.rst-wdb-02
    gateway_id = aws_vpn_gateway.VGW-RST.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  tags = {
    Name   = var.route_table_name.rst-wdb
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

# resource "aws_route_table_association" "RTB-ASS-RST-WDB-0" {
#   subnet_id      = aws_subnet.SUB-RST-WDB-0.id
#   route_table_id = aws_route_table.RTB-RST-WDB.id
# }

# resource "aws_route_table_association" "RTB-ASS-RST-WDB-1" {
#   subnet_id      = aws_subnet.SUB-RST-WDB-1.id
#   route_table_id = aws_route_table.RTB-RST-WDB.id
# }

resource "aws_route_table" "RTB-INT-IAP" {
  vpc_id = aws_vpc.VPC-INT.id

  route {
    cidr_block = var.vgw_cidr.int-iap-01
    gateway_id = aws_vpn_gateway.VGW-INT.id
  }

  route {
    cidr_block = var.vgw_cidr.int-iap-02
    gateway_id = aws_vpn_gateway.VGW-INT.id
  }

  #route {
  #  cidr_block                = var.subnet_cidr.cnt-web-0
  #  vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Cnt.id
  #}

  #route {
  #  cidr_block                = var.subnet_cidr.cnt-web-1
  #  vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Cnt.id
  #}

  route {
    cidr_block                = var.subnet_cidr.rst-wap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wdb-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wdb-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Int-to-Rst.id
  }

  #propagating_vgws = ["vgw-03d9d63b7961487c5"]

  tags = {
    Name   = var.route_table_name.int-iap
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-INT-IAP-0" {
  subnet_id      = aws_subnet.SUB-INT-IAP-0.id
  route_table_id = aws_route_table.RTB-INT-IAP.id
}

resource "aws_route_table_association" "RTB-ASS-INT-IAP-1" {
  subnet_id      = aws_subnet.SUB-INT-IAP-1.id
  route_table_id = aws_route_table.RTB-INT-IAP.id
}

resource "aws_route_table" "RTB-INT-IDB" {
  vpc_id = aws_vpc.VPC-INT.id

  route {
    cidr_block = var.vgw_cidr.int-idb-01
    gateway_id = aws_vpn_gateway.VGW-INT.id
  }

  route {
    cidr_block = var.vgw_cidr.int-idb-02
    gateway_id = aws_vpn_gateway.VGW-INT.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-mgt-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.mgt-flx-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  tags = {
    Name   = var.route_table_name.int-idb
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-INT-IDB-0" {
  subnet_id      = aws_subnet.SUB-INT-IDB-0.id
  route_table_id = aws_route_table.RTB-INT-IDB.id
}

resource "aws_route_table_association" "RTB-ASS-INT-IDB-1" {
  subnet_id      = aws_subnet.SUB-INT-IDB-1.id
  route_table_id = aws_route_table.RTB-INT-IDB.id
}

resource "aws_route_table" "RTB-MGT-MGT" {
  vpc_id = aws_vpc.VPC-MGT.id

  route {
    cidr_block = var.vgw_cidr.mgt-mgt-01
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block = var.vgw_cidr.mgt-mgt-02
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-glm-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-glm-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-web-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-web-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wdb-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wdb-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-idb-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-idb-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  # intecがbastionを使用していたと思われるため削除
  # 下のrouteは一応残しておく

  # Bastionと新受付のピアリングの為に追加。ここでエラーが起きた場合は、正しいピアリングのIDとCIDRを設定してください。
  # route {
  #   cidr_block                = "10.1.0.0/16"
  #   vpc_peering_connection_id = "pcx-0a2f284d085134315"
  # }

  # Bastionと新受付のピアリングの為に追加。ここでエラーが起きた場合は、正しいピアリングのIDとCIDRを設定してください。
  route {
    cidr_block = "10.121.20.0/24"
    # vpc_peering_connection_id = "pcx-0bb06e55b647f84c2"
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  #propagating_vgws = ["vgw-0bd976db08ebeb724"]

  tags = {
    Name   = var.route_table_name.mgt-mgt
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-MGT-MGT-0" {
  subnet_id      = aws_subnet.SUB-MGT-MGT-0.id
  route_table_id = aws_route_table.RTB-MGT-MGT.id
}

resource "aws_route_table_association" "RTB-ASS-MGT-MGT-1" {
  subnet_id      = aws_subnet.SUB-MGT-MGT-1.id
  route_table_id = aws_route_table.RTB-MGT-MGT.id
}

resource "aws_route_table" "RTB-MGT-FLX" {
  vpc_id = aws_vpc.VPC-MGT.id

  route {
    cidr_block = var.vgw_cidr.mgt-flx-01
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block = var.vgw_cidr.mgt-flx-02
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block = var.vgw_cidr.mgt-flx-03
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block = var.vgw_cidr.mgt-flx-04
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block = var.vgw_cidr.mgt-flx-05
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block = var.vgw_cidr.mgt-flx-06
    gateway_id = aws_vpn_gateway.VGW-MGT.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-glm-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-glm-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-web-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-web-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wdb-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.rst-wdb-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Rst.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-iap-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-idb-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  route {
    cidr_block                = var.subnet_cidr.int-idb-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Mgt-to-Int.id
  }

  tags = {
    Name   = var.route_table_name.mgt-flx
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-MGT-FLX-0" {
  subnet_id      = aws_subnet.SUB-MGT-FLX-0.id
  route_table_id = aws_route_table.RTB-MGT-FLX.id
}

resource "aws_route_table_association" "RTB-ASS-MGT-FLX-1" {
  subnet_id      = aws_subnet.SUB-MGT-FLX-1.id
  route_table_id = aws_route_table.RTB-MGT-FLX.id
}

resource "aws_route_table" "RTB-INT-ILB" {
  vpc_id = aws_vpc.VPC-INT.id

  route {
    cidr_block = var.vgw_cidr.int-ilb-01
    gateway_id = aws_vpn_gateway.VGW-INT.id
  }

  tags = {
    Name   = var.route_table_name.int-ilb
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table_association" "RTB-ASS-INT-ILB-0" {
  subnet_id      = aws_subnet.SUB-INT-ILB-0.id
  route_table_id = aws_route_table.RTB-INT-ILB.id
}

resource "aws_route_table_association" "RTB-ASS-INT-ILB-1" {
  subnet_id      = aws_subnet.SUB-INT-ILB-1.id
  route_table_id = aws_route_table.RTB-INT-ILB.id
}

resource "aws_route_table" "RTB-RST-SLB" {
  vpc_id = aws_vpc.VPC-RST.id

  route {
    cidr_block                = var.subnet_cidr.cnt-web-a
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  route {
    cidr_block                = var.subnet_cidr.cnt-web-c
    vpc_peering_connection_id = aws_vpc_peering_connection.PER-Rst-to-Cnt.id
  }

  tags = {
    Name   = var.route_table_name.rst-slb
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

resource "aws_route_table" "RTB-INT-SLB" {
  vpc_id = aws_vpc.VPC-INT.id

  route {
    cidr_block = var.vgw_cidr.int-slb-01
    gateway_id = aws_vpn_gateway.VGW-INT.id
  }

  tags = {
    Name   = var.route_table_name.int-slb
    System = var.tags.System
    Cost   = var.tags.Cost
    Env    = var.tags.Env
  }
}

# 生徒・支払者向けALB用サブネット（リバプロ）
resource "aws_subnet" "sub-cnt-slb-a" {
  vpc_id                  = aws_vpc.VPC-CNT.id
  cidr_block              = var.suk_subnet.cnt-slb-a
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name    = "SUB-${var.tags.Env}-CNT-SLB-A"
    System  = var.tags.System
    Env     = var.tags.Env
    Cost    = var.tags.Cost
    Owner   = var.tags.Owner
    created = var.tags.created
  }
}

resource "aws_subnet" "sub-cnt-slb-c" {
  vpc_id                  = aws_vpc.VPC-CNT.id
  cidr_block              = var.suk_subnet.cnt-slb-c
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name    = "SUB-${var.tags.Env}-CNT-SLB-C"
    System  = var.tags.System
    Env     = var.tags.Env
    Cost    = var.tags.Cost
    Owner   = var.tags.Owner
    created = var.tags.created
  }
}

# 生徒・支払者向けALB用サブネット（AP）
resource "aws_subnet" "sub-rst-slb-a" {
  vpc_id                  = aws_vpc.VPC-RST.id
  cidr_block              = var.suk_subnet.rst-slb-a
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name    = "SUB-${var.tags.Env}-RST-SLB-A"
    System  = var.tags.System
    Env     = var.tags.Env
    Cost    = var.tags.Cost
    Owner   = var.tags.Owner
    created = var.tags.created
  }
}

resource "aws_subnet" "sub-rst-slb-c" {
  vpc_id                  = aws_vpc.VPC-RST.id
  cidr_block              = var.suk_subnet.rst-slb-c
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name    = "SUB-${var.tags.Env}-RST-SLB-C"
    System  = var.tags.System
    Env     = var.tags.Env
    Cost    = var.tags.Cost
    Owner   = var.tags.Owner
    created = var.tags.created
  }
}

# 職員向けALB用（リバプロ/AP）
resource "aws_subnet" "sub-int-slb-a" {
  vpc_id                  = aws_vpc.VPC-INT.id
  cidr_block              = var.suk_subnet.int-slb-a
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name    = "SUB-${var.tags.Env}-INT-SLB-A"
    System  = var.tags.System
    Env     = var.tags.Env
    Cost    = var.tags.Cost
    Owner   = var.tags.Owner
    created = var.tags.created
  }
}

resource "aws_subnet" "sub-int-slb-c" {
  vpc_id                  = aws_vpc.VPC-INT.id
  cidr_block              = var.suk_subnet.int-slb-c
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name    = "SUB-${var.tags.Env}-INT-SLB-C"
    System  = var.tags.System
    Env     = var.tags.Env
    Cost    = var.tags.Cost
    Owner   = var.tags.Owner
    created = var.tags.created
  }
}

# DMS用Subnet
resource "aws_subnet" "sub-rst-wdb-d" {
  vpc_id                  = aws_vpc.VPC-RST.id
  cidr_block              = var.suk_subnet.rst-wdb-d
  availability_zone       = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = false
  tags = {
    Name    = "SUB-${var.tags.Env}-RST-WDB-D"
    System  = var.tags.System
    Env     = var.tags.Env
    Cost    = var.tags.Cost
    Owner   = var.tags.Owner
    created = var.tags.created
  }
}

# resource "aws_elasticache_subnet_group" "suk" {
#   name        = local.subgrp_elc
#   description = local.subgrp_elc
#   subnet_ids = [
#     data.aws_subnet.suk-sub-rst-wap-a.id,
#     data.aws_subnet.suk-sub-rst-wap-c.id
#   ]
# }


# resource "aws_db_subnet_group" "suk_db" {
#   name        = local.subgrp_wdb1
#   description = local.subgrp_wdb1
#   subnet_ids = [
#     data.aws_subnet.suk-sub-rst-wdb-a.id,
#     data.aws_subnet.suk-sub-rst-wdb-c.id
#   ]

#   tags = {
#     Name    = local.subgrp_wdb1
#     Cost    = var.tags.Cost
#     Owner   = var.tags.Owner
#     System  = var.tags.System
#     Env     = var.tags.Env
#     created = var.tags.created
#   }
# }

# resource "aws_db_subnet_group" "suk_repdb" {
#   name        = local.subgrp_wdb2
#   description = local.subgrp_wdb2
#   subnet_ids = [
#     data.aws_subnet.suk-sub-rst-wdb-a.id,
#     data.aws_subnet.suk-sub-rst-wdb-c.id
#     # data.aws_subnet.suk-sub-rst-wdb-c.id,
#     # aws_subnet.sub-rst-wdb-d.id
#   ]

#   tags = {
#     Name    = local.subgrp_wdb2
#     Cost    = var.tags.Cost
#     Owner   = var.tags.Owner
#     System  = var.tags.System
#     Env     = var.tags.Env
#     created = var.tags.created
#   }
# }

# resource "aws_dms_replication_subnet_group" "suk_dms" {
#   replication_subnet_group_id          = local.subgrp_dms
#   replication_subnet_group_description = local.subgrp_dms
#   subnet_ids = [
#     data.aws_subnet.suk-sub-rst-wdb-a.id,
#     data.aws_subnet.suk-sub-rst-wdb-c.id
#     # data.aws_subnet.suk-sub-rst-wdb-c.id,
#     # aws_subnet.sub-rst-wdb-d.id
#   ]

#   tags = {
#     Name    = local.subgrp_dms
#     Cost    = var.tags.Cost
#     Owner   = var.tags.Owner
#     System  = var.tags.System
#     Env     = var.tags.Env
#     created = var.tags.created
#   }
# }

## rout table association
### cnt rp
# resource "aws_route_table_association" "suk-cnt-slb-a" {
#   subnet_id      = aws_subnet.sub-cnt-slb-a.id
#   route_table_id = data.aws_route_table.suk-routetable-cnt-web.id
# }
# resource "aws_route_table_association" "suk-cnt-slb-c" {
#   subnet_id      = aws_subnet.sub-cnt-slb-c.id
#   route_table_id = data.aws_route_table.suk-routetable-cnt-web.id
# }

# output "elasticache_subnetgroup" {
#   value = aws_elasticache_subnet_group.suk.id
# }
/* ***************************** Subnet ***************************** */
resource "aws_subnet" "SUB-CNT-GLO-0" {
  vpc_id                  = "${aws_vpc.VPC-CNT.id}"
  cidr_block              = var.subnet_cidr.cnt-glo-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.cnt-glo-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-CNT-GLO-1" {
  vpc_id                  = "${aws_vpc.VPC-CNT.id}"
  cidr_block              = var.subnet_cidr.cnt-glo-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.cnt-glo-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-CNT-GLM-0" {
  vpc_id                  = "${aws_vpc.VPC-CNT.id}"
  cidr_block              = var.subnet_cidr.cnt-glm-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.cnt-glm-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-CNT-GLM-1" {
  vpc_id                  = "${aws_vpc.VPC-CNT.id}"
  cidr_block              = var.subnet_cidr.cnt-glm-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.cnt-glm-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-CNT-WEB-0" {
  vpc_id                  = "${aws_vpc.VPC-CNT.id}"
  cidr_block              = var.subnet_cidr.cnt-web-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.cnt-web-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-CNT-WEB-1" {
  vpc_id                  = "${aws_vpc.VPC-CNT.id}"
  cidr_block              = var.subnet_cidr.cnt-web-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.cnt-web-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
# resource "aws_subnet" "SUB-RST-WAP-0" {
#   vpc_id                  = "${aws_vpc.VPC-RST.id}"
#   cidr_block              = var.subnet_cidr.rst-wap-a
#   availability_zone       = "${data.aws_availability_zones.available.names[0]}"
#   map_public_ip_on_launch = false
#   tags = {
#     System = var.tags.System
#     Name   = var.subnet_name.rst-wap-a
#     Env    = var.tags.Env
#     Cost   = var.tags.Cost
#   }
# }
# resource "aws_subnet" "SUB-RST-WAP-1" {
#   vpc_id                  = "${aws_vpc.VPC-RST.id}"
#   cidr_block              = var.subnet_cidr.rst-wap-c
#   availability_zone       = "${data.aws_availability_zones.available.names[1]}"
#   map_public_ip_on_launch = false
#   tags = {
#     System = var.tags.System
#     Name   = var.subnet_name.rst-wap-c
#     Env    = var.tags.Env
#     Cost   = var.tags.Cost
#   }
# }
resource "aws_subnet" "SUB-RST-CHK-0" {
  vpc_id                  = "${aws_vpc.VPC-RST.id}"
  cidr_block              = var.subnet_cidr.rst-chk-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.rst-chk-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-RST-CHK-1" {
  vpc_id                  = "${aws_vpc.VPC-RST.id}"
  cidr_block              = var.subnet_cidr.rst-chk-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.rst-chk-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
#resource "aws_subnet" "SUB-RST-CHK2-0" {
#  vpc_id                  = "${aws_vpc.VPC-RST.id}"
#  cidr_block              = var.subnet_cidr.rst-chk2-a
#  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
#  map_public_ip_on_launch = false
#  tags = {
#    System = var.tags.System
#    Name   = var.subnet_name.rst-chk2-a
#    Env    = var.tags.Env
#    Cost   = var.tags.Cost
#  }
#}
#resource "aws_subnet" "SUB-RST-CHK2-1" {
#  vpc_id                  = "${aws_vpc.VPC-RST.id}"
#  cidr_block              = var.subnet_cidr.rst-chk2-c
#  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
#  map_public_ip_on_launch = false
#  tags = {
#    System = var.tags.System
#    Name   = var.subnet_name.rst-chk2-c
#    Env    = var.tags.Env
#    Cost   = var.tags.Cost
#  }
#}
# resource "aws_subnet" "SUB-RST-WDB-0" {
#   vpc_id                  = "${aws_vpc.VPC-RST.id}"
#   cidr_block              = var.subnet_cidr.rst-wdb-a
#   availability_zone       = "${data.aws_availability_zones.available.names[0]}"
#   map_public_ip_on_launch = false
#   tags = {
#     System = var.tags.System
#     Name   = var.subnet_name.rst-wdb-a
#     Env    = var.tags.Env
#     Cost   = var.tags.Cost
#   }
# }
# resource "aws_subnet" "SUB-RST-WDB-1" {
#   vpc_id                  = "${aws_vpc.VPC-RST.id}"
#   cidr_block              = var.subnet_cidr.rst-wdb-c
#   availability_zone       = "${data.aws_availability_zones.available.names[1]}"
#   map_public_ip_on_launch = false
#   tags = {
#     System = var.tags.System
#     Name   = var.subnet_name.rst-wdb-c
#     Env    = var.tags.Env
#     Cost   = var.tags.Cost
#   }
# }
resource "aws_subnet" "SUB-INT-IAP-0" {
  vpc_id                  = "${aws_vpc.VPC-INT.id}"
  cidr_block              = var.subnet_cidr.int-iap-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.int-iap-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-INT-IAP-1" {
  vpc_id                  = "${aws_vpc.VPC-INT.id}"
  cidr_block              = var.subnet_cidr.int-iap-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.int-iap-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-INT-ILB-0" {
  vpc_id                  = "${aws_vpc.VPC-INT.id}"
  cidr_block              = var.subnet_cidr.int-ilb-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.int-ilb-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-INT-ILB-1" {
  vpc_id                  = "${aws_vpc.VPC-INT.id}"
  cidr_block              = var.subnet_cidr.int-ilb-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.int-ilb-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-INT-IDB-0" {
  vpc_id                  = "${aws_vpc.VPC-INT.id}"
  cidr_block              = var.subnet_cidr.int-idb-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.int-idb-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-INT-IDB-1" {
  vpc_id                  = "${aws_vpc.VPC-INT.id}"
  cidr_block              = var.subnet_cidr.int-idb-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.int-idb-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-MGT-MGT-0" {
  vpc_id                  = "${aws_vpc.VPC-MGT.id}"
  cidr_block              = var.subnet_cidr.mgt-mgt-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.mgt-mgt-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-MGT-MGT-1" {
  vpc_id                  = "${aws_vpc.VPC-MGT.id}"
  cidr_block              = var.subnet_cidr.mgt-mgt-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.mgt-mgt-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-MGT-FLX-0" {
  vpc_id                  = "${aws_vpc.VPC-MGT.id}"
  cidr_block              = var.subnet_cidr.mgt-flx-a
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.mgt-flx-a
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
resource "aws_subnet" "SUB-MGT-FLX-1" {
  vpc_id                  = "${aws_vpc.VPC-MGT.id}"
  cidr_block              = var.subnet_cidr.mgt-flx-c
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = false
  tags = {
    System = var.tags.System
    Name   = var.subnet_name.mgt-flx-c
    Env    = var.tags.Env
    Cost   = var.tags.Cost
  }
}
