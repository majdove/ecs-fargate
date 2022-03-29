resource "aws_ecs_cluster" "main" {
  name = "${var.name}-cluster-${var.environment}"
}

resource "aws_ecs_service" "main" {
  name                               = "${var.name}-service-${var.environment}"
  cluster                            = aws_ecs_cluster.main.id
  task_definition                    = aws_ecs_task_definition.main.arn
  desired_count                      = 2
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = aws_security_group.ecs_tasks.id
    subnets          = aws_subnet.public.*.id
    assign_public_ip = false
  }

#   load_balancer {
#     target_group_arn = var.aws_alb_target_group_arn
#     container_name   = "${var.name}-container-${var.environment}"
#     container_port   = var.container_port
#   }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}