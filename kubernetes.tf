locals = {
  bastion_autoscaling_group_ids     = ["${aws_autoscaling_group.bastions-nurjancluster-com.id}"]
  bastion_security_group_ids        = ["${aws_security_group.bastion-nurjancluster-com.id}"]
  bastions_role_arn                 = "${aws_iam_role.bastions-nurjancluster-com.arn}"
  bastions_role_name                = "${aws_iam_role.bastions-nurjancluster-com.name}"
  cluster_name                      = "nurjancluster.com"
  master_autoscaling_group_ids      = ["${aws_autoscaling_group.master-us-west-1b-masters-nurjancluster-com.id}"]
  master_security_group_ids         = ["${aws_security_group.masters-nurjancluster-com.id}"]
  masters_role_arn                  = "${aws_iam_role.masters-nurjancluster-com.arn}"
  masters_role_name                 = "${aws_iam_role.masters-nurjancluster-com.name}"
  node_autoscaling_group_ids        = ["${aws_autoscaling_group.nodes-nurjancluster-com.id}"]
  node_security_group_ids           = ["${aws_security_group.nodes-nurjancluster-com.id}"]
  node_subnet_ids                   = ["${aws_subnet.us-west-1b-nurjancluster-com.id}", "${aws_subnet.us-west-1c-nurjancluster-com.id}"]
  nodes_role_arn                    = "${aws_iam_role.nodes-nurjancluster-com.arn}"
  nodes_role_name                   = "${aws_iam_role.nodes-nurjancluster-com.name}"
  region                            = "us-west-1"
  route_table_private-us-west-1b_id = "${aws_route_table.private-us-west-1b-nurjancluster-com.id}"
  route_table_private-us-west-1c_id = "${aws_route_table.private-us-west-1c-nurjancluster-com.id}"
  route_table_public_id             = "${aws_route_table.nurjancluster-com.id}"
  subnet_us-west-1b_id              = "${aws_subnet.us-west-1b-nurjancluster-com.id}"
  subnet_us-west-1c_id              = "${aws_subnet.us-west-1c-nurjancluster-com.id}"
  subnet_utility-us-west-1b_id      = "${aws_subnet.utility-us-west-1b-nurjancluster-com.id}"
  subnet_utility-us-west-1c_id      = "${aws_subnet.utility-us-west-1c-nurjancluster-com.id}"
  vpc_cidr_block                    = "${aws_vpc.nurjancluster-com.cidr_block}"
  vpc_id                            = "${aws_vpc.nurjancluster-com.id}"
}

output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-nurjancluster-com.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-nurjancluster-com.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-nurjancluster-com.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-nurjancluster-com.name}"
}

output "cluster_name" {
  value = "nurjancluster.com"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-us-west-1b-masters-nurjancluster-com.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-nurjancluster-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-nurjancluster-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-nurjancluster-com.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-nurjancluster-com.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-nurjancluster-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-west-1b-nurjancluster-com.id}", "${aws_subnet.us-west-1c-nurjancluster-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-nurjancluster-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-nurjancluster-com.name}"
}

output "region" {
  value = "us-west-1"
}

output "route_table_private-us-west-1b_id" {
  value = "${aws_route_table.private-us-west-1b-nurjancluster-com.id}"
}

output "route_table_private-us-west-1c_id" {
  value = "${aws_route_table.private-us-west-1c-nurjancluster-com.id}"
}

output "route_table_public_id" {
  value = "${aws_route_table.nurjancluster-com.id}"
}

output "subnet_us-west-1b_id" {
  value = "${aws_subnet.us-west-1b-nurjancluster-com.id}"
}

output "subnet_us-west-1c_id" {
  value = "${aws_subnet.us-west-1c-nurjancluster-com.id}"
}

output "subnet_utility-us-west-1b_id" {
  value = "${aws_subnet.utility-us-west-1b-nurjancluster-com.id}"
}

output "subnet_utility-us-west-1c_id" {
  value = "${aws_subnet.utility-us-west-1c-nurjancluster-com.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.nurjancluster-com.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.nurjancluster-com.id}"
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_autoscaling_attachment" "bastions-nurjancluster-com" {
  elb                    = "${aws_elb.bastion-nurjancluster-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-nurjancluster-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-1b-masters-nurjancluster-com" {
  elb                    = "${aws_elb.api-nurjancluster-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-1b-masters-nurjancluster-com.id}"
}

resource "aws_autoscaling_group" "bastions-nurjancluster-com" {
  name                 = "bastions.nurjancluster.com"
  launch_configuration = "${aws_launch_configuration.bastions-nurjancluster-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.utility-us-west-1b-nurjancluster-com.id}", "${aws_subnet.utility-us-west-1c-nurjancluster-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "nurjancluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.nurjancluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-1b-masters-nurjancluster-com" {
  name                 = "master-us-west-1b.masters.nurjancluster.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-1b-masters-nurjancluster-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-1b-nurjancluster-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "nurjancluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-1b.masters.nurjancluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-1b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-nurjancluster-com" {
  name                 = "nodes.nurjancluster.com"
  launch_configuration = "${aws_launch_configuration.nodes-nurjancluster-com.id}"
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = ["${aws_subnet.us-west-1b-nurjancluster-com.id}", "${aws_subnet.us-west-1c-nurjancluster-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "nurjancluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.nurjancluster.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "b-etcd-events-nurjancluster-com" {
  availability_zone = "us-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "b.etcd-events.nurjancluster.com"
    "k8s.io/etcd/events"                      = "b/b"
    "k8s.io/role/master"                      = "1"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-nurjancluster-com" {
  availability_zone = "us-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "b.etcd-main.nurjancluster.com"
    "k8s.io/etcd/main"                        = "b/b"
    "k8s.io/role/master"                      = "1"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_eip" "us-west-1b-nurjancluster-com" {
  vpc = true

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "us-west-1b.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_eip" "us-west-1c-nurjancluster-com" {
  vpc = true

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "us-west-1c.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_elb" "api-nurjancluster-com" {
  name = "api-nurjancluster-com-nlpp26"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-nurjancluster-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-1b-nurjancluster-com.id}", "${aws_subnet.utility-us-west-1c-nurjancluster-com.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "nurjancluster.com"
    Name              = "api.nurjancluster.com"
  }
}

resource "aws_elb" "bastion-nurjancluster-com" {
  name = "bastion-nurjancluster-com-5mnmc0"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-nurjancluster-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-1b-nurjancluster-com.id}", "${aws_subnet.utility-us-west-1c-nurjancluster-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "nurjancluster.com"
    Name              = "bastion.nurjancluster.com"
  }
}

resource "aws_iam_instance_profile" "bastions-nurjancluster-com" {
  name = "bastions.nurjancluster.com"
  role = "${aws_iam_role.bastions-nurjancluster-com.name}"
}

resource "aws_iam_instance_profile" "masters-nurjancluster-com" {
  name = "masters.nurjancluster.com"
  role = "${aws_iam_role.masters-nurjancluster-com.name}"
}

resource "aws_iam_instance_profile" "nodes-nurjancluster-com" {
  name = "nodes.nurjancluster.com"
  role = "${aws_iam_role.nodes-nurjancluster-com.name}"
}

resource "aws_iam_role" "bastions-nurjancluster-com" {
  name               = "bastions.nurjancluster.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.nurjancluster.com_policy")}"
}

resource "aws_iam_role" "masters-nurjancluster-com" {
  name               = "masters.nurjancluster.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.nurjancluster.com_policy")}"
}

resource "aws_iam_role" "nodes-nurjancluster-com" {
  name               = "nodes.nurjancluster.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.nurjancluster.com_policy")}"
}

resource "aws_iam_role_policy" "bastions-nurjancluster-com" {
  name   = "bastions.nurjancluster.com"
  role   = "${aws_iam_role.bastions-nurjancluster-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.nurjancluster.com_policy")}"
}

resource "aws_iam_role_policy" "masters-nurjancluster-com" {
  name   = "masters.nurjancluster.com"
  role   = "${aws_iam_role.masters-nurjancluster-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.nurjancluster.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-nurjancluster-com" {
  name   = "nodes.nurjancluster.com"
  role   = "${aws_iam_role.nodes-nurjancluster-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.nurjancluster.com_policy")}"
}

resource "aws_internet_gateway" "nurjancluster-com" {
  vpc_id = "${aws_vpc.nurjancluster-com.id}"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_key_pair" "kubernetes-nurjancluster-com-fff9a267ed92123f049c4380510a90e9" {
  key_name   = "kubernetes.nurjancluster.com-ff:f9:a2:67:ed:92:12:3f:04:9c:43:80:51:0a:90:e9"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.nurjancluster.com-fff9a267ed92123f049c4380510a90e9_public_key")}"
}

resource "aws_launch_configuration" "bastions-nurjancluster-com" {
  name_prefix                 = "bastions.nurjancluster.com-"
  image_id                    = "ami-0a34dc66f2d0cf25b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-nurjancluster-com-fff9a267ed92123f049c4380510a90e9.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-nurjancluster-com.id}"
  security_groups             = ["${aws_security_group.bastion-nurjancluster-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-1b-masters-nurjancluster-com" {
  name_prefix                 = "master-us-west-1b.masters.nurjancluster.com-"
  image_id                    = "ami-0a34dc66f2d0cf25b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-nurjancluster-com-fff9a267ed92123f049c4380510a90e9.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-nurjancluster-com.id}"
  security_groups             = ["${aws_security_group.masters-nurjancluster-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-1b.masters.nurjancluster.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-nurjancluster-com" {
  name_prefix                 = "nodes.nurjancluster.com-"
  image_id                    = "ami-0a34dc66f2d0cf25b"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-nurjancluster-com-fff9a267ed92123f049c4380510a90e9.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-nurjancluster-com.id}"
  security_groups             = ["${aws_security_group.nodes-nurjancluster-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.nurjancluster.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_nat_gateway" "us-west-1b-nurjancluster-com" {
  allocation_id = "${aws_eip.us-west-1b-nurjancluster-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-1b-nurjancluster-com.id}"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "us-west-1b.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-1c-nurjancluster-com" {
  allocation_id = "${aws_eip.us-west-1c-nurjancluster-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-1c-nurjancluster-com.id}"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "us-west-1c.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.nurjancluster-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.nurjancluster-com.id}"
}

resource "aws_route" "private-us-west-1b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-1b-nurjancluster-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-1b-nurjancluster-com.id}"
}

resource "aws_route" "private-us-west-1c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-1c-nurjancluster-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-1c-nurjancluster-com.id}"
}

resource "aws_route53_record" "api-nurjancluster-com" {
  name = "api.nurjancluster.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-nurjancluster-com.dns_name}"
    zone_id                = "${aws_elb.api-nurjancluster-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z23NWY2NM6A665"
}

resource "aws_route53_record" "bastion-nurjancluster-com" {
  name = "bastion.nurjancluster.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-nurjancluster-com.dns_name}"
    zone_id                = "${aws_elb.bastion-nurjancluster-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z23NWY2NM6A665"
}

resource "aws_route53_zone_association" "Z23NWY2NM6A665" {
  zone_id = "/hostedzone/Z23NWY2NM6A665"
  vpc_id  = "${aws_vpc.nurjancluster-com.id}"
}

resource "aws_route_table" "nurjancluster-com" {
  vpc_id = "${aws_vpc.nurjancluster-com.id}"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
    "kubernetes.io/kops/role"                 = "public"
  }
}

resource "aws_route_table" "private-us-west-1b-nurjancluster-com" {
  vpc_id = "${aws_vpc.nurjancluster-com.id}"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "private-us-west-1b.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
    "kubernetes.io/kops/role"                 = "private-us-west-1b"
  }
}

resource "aws_route_table" "private-us-west-1c-nurjancluster-com" {
  vpc_id = "${aws_vpc.nurjancluster-com.id}"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "private-us-west-1c.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
    "kubernetes.io/kops/role"                 = "private-us-west-1c"
  }
}

resource "aws_route_table_association" "private-us-west-1b-nurjancluster-com" {
  subnet_id      = "${aws_subnet.us-west-1b-nurjancluster-com.id}"
  route_table_id = "${aws_route_table.private-us-west-1b-nurjancluster-com.id}"
}

resource "aws_route_table_association" "private-us-west-1c-nurjancluster-com" {
  subnet_id      = "${aws_subnet.us-west-1c-nurjancluster-com.id}"
  route_table_id = "${aws_route_table.private-us-west-1c-nurjancluster-com.id}"
}

resource "aws_route_table_association" "utility-us-west-1b-nurjancluster-com" {
  subnet_id      = "${aws_subnet.utility-us-west-1b-nurjancluster-com.id}"
  route_table_id = "${aws_route_table.nurjancluster-com.id}"
}

resource "aws_route_table_association" "utility-us-west-1c-nurjancluster-com" {
  subnet_id      = "${aws_subnet.utility-us-west-1c-nurjancluster-com.id}"
  route_table_id = "${aws_route_table.nurjancluster-com.id}"
}

resource "aws_security_group" "api-elb-nurjancluster-com" {
  name        = "api-elb.nurjancluster.com"
  vpc_id      = "${aws_vpc.nurjancluster-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "api-elb.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-nurjancluster-com" {
  name        = "bastion-elb.nurjancluster.com"
  vpc_id      = "${aws_vpc.nurjancluster-com.id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "bastion-elb.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_security_group" "bastion-nurjancluster-com" {
  name        = "bastion.nurjancluster.com"
  vpc_id      = "${aws_vpc.nurjancluster-com.id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "bastion.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_security_group" "masters-nurjancluster-com" {
  name        = "masters.nurjancluster.com"
  vpc_id      = "${aws_vpc.nurjancluster-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "masters.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_security_group" "nodes-nurjancluster-com" {
  name        = "nodes.nurjancluster.com"
  vpc_id      = "${aws_vpc.nurjancluster-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "nodes.nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.masters-nurjancluster-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.masters-nurjancluster-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-nurjancluster-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-nurjancluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-nurjancluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-nurjancluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.bastion-nurjancluster-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.bastion-nurjancluster-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-nurjancluster-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-nurjancluster-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-nurjancluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-nurjancluster-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-nurjancluster-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-nurjancluster-com.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-nurjancluster-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.nodes-nurjancluster-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-nurjancluster-com.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-nurjancluster-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-nurjancluster-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-west-1b-nurjancluster-com" {
  vpc_id            = "${aws_vpc.nurjancluster-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-west-1b"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "us-west-1b.nurjancluster.com"
    SubnetType                                = "Private"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
    "kubernetes.io/role/internal-elb"         = "1"
  }
}

resource "aws_subnet" "us-west-1c-nurjancluster-com" {
  vpc_id            = "${aws_vpc.nurjancluster-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "us-west-1c"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "us-west-1c.nurjancluster.com"
    SubnetType                                = "Private"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
    "kubernetes.io/role/internal-elb"         = "1"
  }
}

resource "aws_subnet" "utility-us-west-1b-nurjancluster-com" {
  vpc_id            = "${aws_vpc.nurjancluster-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "us-west-1b"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "utility-us-west-1b.nurjancluster.com"
    SubnetType                                = "Utility"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
    "kubernetes.io/role/elb"                  = "1"
  }
}

resource "aws_subnet" "utility-us-west-1c-nurjancluster-com" {
  vpc_id            = "${aws_vpc.nurjancluster-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "us-west-1c"

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "utility-us-west-1c.nurjancluster.com"
    SubnetType                                = "Utility"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
    "kubernetes.io/role/elb"                  = "1"
  }
}

resource "aws_vpc" "nurjancluster-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "nurjancluster-com" {
  domain_name         = "us-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                         = "nurjancluster.com"
    Name                                      = "nurjancluster.com"
    "kubernetes.io/cluster/nurjancluster.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "nurjancluster-com" {
  vpc_id          = "${aws_vpc.nurjancluster-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.nurjancluster-com.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
