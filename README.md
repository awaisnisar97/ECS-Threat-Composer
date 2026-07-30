# Production Ready ECS Platform on AWS

## Overview

This project demonstrates the design, deployment and automation of a production style containerised application running on Amazon ECS Fargate.

The goal was to build a complete cloud deployment workflow using modern DevOps practices. The project follows a real world approach by first understanding the AWS services through a manual deployment before rebuilding the environment using Infrastructure as Code and automating deployments through CI/CD.

The final solution provides a secure, scalable and repeatable way to deploy containerised applications on AWS.

---

# Project Objectives

The main objectives of this project were to:

- Build and containerise an application using Docker
- Deploy a containerised workload using Amazon ECS Fargate
- Store and manage container images using Amazon ECR
- Provision AWS infrastructure using Terraform
- Configure HTTPS using AWS Certificate Manager
- Configure custom domain routing using Route 53
- Implement automated deployments using GitHub Actions
- Use OpenID Connect for secure AWS authentication
- Apply cloud security best practices using IAM and security groups

---

# Architecture Overview

The application is deployed using a production style AWS architecture.

User traffic is routed through Route 53 to an Application Load Balancer secured with HTTPS. The load balancer distributes requests to an ECS Fargate service running Docker containers. Container images are stored in Amazon Elastic Container Registry, and application logs are collected using Amazon CloudWatch.

The infrastructure is designed to be secure, scalable and fully reproducible using Terraform.



---

# Technology Stack

## Cloud Platform

**Amazon Web Services**

AWS services used:

- Amazon ECS Fargate
- Amazon Elastic Container Registry (ECR)
- Application Load Balancer
- Amazon VPC
- Route 53
- AWS Certificate Manager
- Identity and Access Management (IAM)
- Amazon CloudWatch

---

## Infrastructure as Code

**Terraform**

Terraform is used to provision and manage AWS infrastructure.

Implemented:

- VPC and networking components
- ECS cluster and services
- Application Load Balancer configuration
- Security groups
- IAM roles
- ECR repository
- DNS configuration
- SSL certificate management

---

## Containerisation

**Docker**

Implemented:

- Multi stage Docker builds
- Optimised container images
- Non root container execution
- Container health checks
- Local container testing before deployment

---

## CI/CD Automation

**GitHub Actions**

The deployment pipeline automates:

- Docker image creation
- Image tagging
- Pushing images to Amazon ECR
- Terraform validation
- Infrastructure deployment
- Application health checks after deployment

---

# Deployment Approach

This project follows a production style deployment workflow.

The process begins with understanding how the AWS services work together through manual configuration.

Once the application is successfully deployed manually, the infrastructure is removed and recreated using Terraform.

This approach ensures a strong understanding of both:

**Manual AWS operations**

Understanding how ECS, networking, load balancing and security components work together.

**Infrastructure as Code**

Creating repeatable, version-controlled and automated infrastructure deployments.

---

# Security Implementation

Security has been considered throughout the project.

Implemented:

- HTTPS encryption using AWS Certificate Manager
- IAM roles instead of long lived AWS access keys
- GitHub Actions authentication using OpenID Connect
- Restricted network access using security groups
- Non root Docker container execution
- Separation of application and infrastructure configuration

---

# Continuous Integration and Deployment Workflow

The automated deployment process follows this flow:

1. Developer pushes code changes to GitHub

2. GitHub Actions starts the deployment workflow

3. Docker image is built and tagged

4. Image is pushed to Amazon ECR

5. Terraform validates and deploys AWS infrastructure changes

6. ECS Fargate deploys the updated application

7. Automated health checks confirm successful deployment

---

# Screenshots

Screenshots will be added showing:

- Application running locally
- Docker container running successfully
- Amazon ECR image repository
- ECS service deployment
- HTTPS application endpoint
- GitHub Actions pipeline success
- Terraform deployment output
- CloudWatch application logs

---

# Future Improvements

Potential improvements include:

- Add AWS Secrets Manager integration
- Add container vulnerability scanning using Trivy
- Add Terraform security scanning
- Implement ECS auto scaling
- Add AWS WAF protection
- Implement blue/green deployments
- Add monitoring dashboards

---

# Key Learning Outcomes

This project provides hands on experience designing and deploying cloud infrastructure using AWS, Terraform, Docker and CI/CD automation.

It demonstrates practical knowledge of container orchestration, Infrastructure as Code, cloud networking, security practices and automated deployment workflows used in modern DevOps environments.
