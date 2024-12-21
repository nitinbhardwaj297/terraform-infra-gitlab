resource "aws_lb" "project_lb" {
    name = "projectalb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.project_security_group.id]
    subnets = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]

}

resource "aws_lb_target_group" "project_tg" {
    name = "albtg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.project_vpc.id

    health_check {
      path = "/"
      port = 80
      timeout = 25
      interval = 30
      unhealthy_threshold = 2
    }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.project_lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "vm1_attachment" {
  target_group_arn = aws_lb_target_group.project_tg.arn
  target_id        = aws_instance.vm1.id   
  port             = 80
  depends_on = [ aws_instance.vm1 ]
}

resource "aws_lb_target_group_attachment" "vm2_attachment" {
  target_group_arn = aws_lb_target_group.project_tg.arn
  target_id        = aws_instance.vm2.id  
  port             = 80
  depends_on = [ aws_instance.vm2 ]
}
