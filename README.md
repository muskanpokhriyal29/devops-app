Built an end-to-end CI/CD pipeline on AWS where I containerized a Python Flask application using Docker,
stored the image in Amazon ECR, provisioned infrastructure using Terraform and automated deployment using GitHub Actions.

🟢 Infrastructure Setup (Terraform)
First, I used Terraform to provision infrastructure on AWS.
I created:
- An EC2 instance
- A Security Group allowing SSH and HTTP
- An S3 bucket and DynamoDB table for remote Terraform state management.

🟢 Containerization (Docker + ECR)
Then I containerized the application using Docker.
I exposed the app on port 5000 and mapped it to port 80 on the EC2 instance. Then, I pushed the Docker image to Amazon ECR for centralized image storage

🟢 CI/CD Automation (GitHub Actions)
I implemented a GitHub Actions workflow that triggers on every push to the main branch.
The pipeline:
- Checks out the code
- Builds the Docker image
- Logs into Amazon ECR
- Pushes the image to ECR
- Deploys the updated container to EC2

🟢 Deployment to EC2
The EC2 instance pulls the latest image from ECR and runs the containerized application. Security groups allow HTTP access from the internet
