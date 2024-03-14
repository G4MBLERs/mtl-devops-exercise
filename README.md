# mtl-devops-exercise
for technical testing with mtl


1. Create a Dockerfile for a given application
Expected Output: Dockerfile

2. Build the image using the Dockerfile and push to Docker Hub
Expected Output: Build and push command and Docker Hub url

3. Create a Helm Chart to deploy the image from the previous step. The chart should
support
- Simple deployment (Deployment, Service, Ingress, etc)
- Argo Rollout resources (https://argo-rollouts.readthedocs.io/en/stable) to perform
Canary Deployment and BlueGreen Deployment
The chart should also have flexibility to allow Developers to adjust Values. They can
choose to use either simple deployment or Canary or Blue Green without having to
rebuild the chart frequently
Expected Output: Helm Chart with values file to deploy the application

4. Setup EKS cluster with the related resources to run EKS like VPC, Subnets, etc. by
following EKS Best Practices using any IaC tools (Bonus point: use
Terraform/Terragrunt)
Expected Output: IaC code

5. When the sample application deploys to EKS, they need to have access to
● S3 with permission GetObject, PutObject (S3 ARN:arn:aws:s3:::my-web-assets)
● SQS with permission; send, receive, delete message (SQS ARN:
arn:aws:sqs:ap-southeast-1:123456789123:lms-import-data)
● Condition: Avoid injecting the generated aws secret/access keys to the
application directly.
Expected Output: IaC code6. Use ArgoCD to deploy this application. To follow GitOps practices, we prefer to have an
ArgoCD application defined declaratively in a YAML file if possible.
Expected output: Yaml files and instruction how to deploy the application or command
line

7. (Bonus point) Create CICD workflow using Github Actions to build and deploy application
Expected output: Github Actions workflow (yml file)

8. Design infrastructure on AWS for 3 tier architecture that supports High Availability, serve
high traffic and expect zero downtime
Expected output: mtl-design.png