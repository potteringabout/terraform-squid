resource "aws_security_group" "alb" {
  name        = "nlb"
  description = "NLB connectivity"
  vpc_id      = var.vpc_id

}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  # checkov:skip=CKV_AWS_260: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 80"
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow ingress traffic to port 80"
}

resource "aws_vpc_security_group_egress_rule" "allow_3128" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3128
  ip_protocol       = "tcp"
  to_port           = 3128
  description       = "Allow egress traffic to squid"

}

#################################################################################################
# This file describes the Load Balancer resources: ALB, ALB target group, ALB listener
#################################################################################################

#Defining the Application Load Balancer
resource "aws_lb" "load_balancer" {
  #checkov:skip=CKV_AWS_152: "Ensure that Load Balancer (Network/Gateway) has cross-zone load balancing enabled"
  #checkov:skip=CKV_AWS_150: "Ensure that Load Balancer has deletion protection enabled"
  #checkov:skip=CKV_AWS_91: "Ensure the ELBv2 (Application/Network) has access logging enabled"
  #checkov:skip=CKV_AWS_131: "Ensure that ALB drops HTTP headers"
  #checkov:skip=CKV2_AWS_20: "Ensure that ALB redirects HTTP requests into HTTPS ones"
  #checkov:skip=CKV2_AWS_28: "Ensure public facing ALB are protected by WAF"
  name               = var.lb["name"]
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.alb.id]
}

#Defining the target group and a health check on the application
resource "aws_lb_target_group" "target_group" {
  name = var.target_group["name"]
  port = var.target_group["port"]
  #protocol    = "HTTP"
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200-499"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 10
    interval            = 30
  }
}


#Defines an HTTP Listener for the ALB
resource "aws_lb_listener" "listener" {
  #checkov:skip=CKV_AWS_2: "Ensure ALB protocol is HTTPS"
  #checkov:skip=CKV_AWS_103: "Ensure that load balancer is using at least TLS 1.2"
  load_balancer_arn = aws_alb.load_balancer.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
