# creating ECS cluster and enabling container insights for monitoring and metrics
resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# creating an IAM role for ECS task execution with the specified name and assume role policy 
resource "aws_iam_role" "ecs_task_execution_role" {
  name = var.ecs_task_execution_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

# attaching the AmazonECSTaskExecutionRolePolicy to the ECS task execution role
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# creating a CloudWatch log group for ECS tasks with the specified name and retention period
resource "aws_cloudwatch_log_group" "ecs_task_log_group" {
  name              = "/ecs/${var.ecs_cluster_name}"
  retention_in_days = 7
}

# defining the ECS task definition with the specified family, network mode, CPU, memory, and execution role
resource "aws_ecs_task_definition" "main" {
  family                   = var.ecs_task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  # defining the container for the ECS task with the specified name, image, and port mappings

  container_definitions = jsonencode([
    {
      name      = var.ecs_container_name
      image     = "${var.ecr_repository_url}:${var.ecr_image_tag}"
      essential = true
      portMappings = [
        {
          containerPort = var.ecs_container_port
          hostPort      = var.ecs_container_port
          protocol      = "tcp"
        }
      ]

      # adding a health check for the ECS container to ensure it is running and healthy 
      healthCheck = {
        command     = ["CMD-SHELL", "curl -f http://localhost:${var.ecs_container_port}/health || exit 1"]
        interval    = 30
        timeout     = 5
        retries     = 3
        startPeriod = 10
      }

      # adding a log configuration for the ECS container to send logs to CloudWatch

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_task_log_group.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = var.ecs_container_name
        }
      }
    }
  ])
}

# creating an ECS service with the specified name, cluster, task definition, desired count, and launch type 
resource "aws_ecs_service" "main" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.ecs_service_desired_count
  launch_type     = "FARGATE"

  # defining the load balancer for the ECS service with the specified load balancer ARN, container name, and container port
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.ecs_container_name
    container_port   = var.ecs_container_port
  }

  # defining the network configuration for the ECS service with the specified subnets, security groups, and public IP assignment
  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [aws_security_group.ecs_service_sg.id]
    assign_public_ip = false
  }
}

# creating a security group for the ECS service with the specified name, description, and VPC ID
resource "aws_security_group" "ecs_service_sg" {
  name        = "${var.ecs_service_name}-sg"
  description = "Security group for ECS service"
  vpc_id      = var.vpc_id
}

# allow my ECS tasks to receive TCP traffic on their container port, but only when the traffic comes from the ALB security group.
resource "aws_vpc_security_group_ingress_rule" "allow_alb" {
  security_group_id            = aws_security_group.ecs_service_sg.id
  referenced_security_group_id = var.load_balancer_sg_id
  from_port                    = var.ecs_container_port
  to_port                      = var.ecs_container_port
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.ecs_service_sg.id
  ip_protocol       = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
