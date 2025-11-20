# Jenkins Setup Guide for Jekyll Blog

This guide explains how to set up Jenkins for your Jekyll blog repository.

## What is Jenkins?

Jenkins is an open-source automation server that helps with:
- **Continuous Integration (CI)**: Automatically build and test code
- **Continuous Deployment (CD)**: Automatically deploy applications
- **Automation**: Run scripts, tests, and deployments on schedule or triggers

## Jenkins vs. GitHub Actions

| Feature | Jenkins | GitHub Actions |
|---------|---------|----------------|
| **Hosting** | Self-hosted (your server) | Cloud-hosted (GitHub) |
| **Cost** | Free (but need server) | Free for public repos |
| **Setup** | More complex | Simple (built-in) |
| **Flexibility** | Very flexible | Good flexibility |
| **Learning** | Great for learning CI/CD | Easier to start |

## Prerequisites

1. **Docker** installed (for running Jenkins and building)
2. **Java** (Jenkins requires Java)
3. **Git** installed
4. **A server/computer** to run Jenkins (or use Docker)

## Setup Options

### Option 1: Jenkins with Docker (Recommended for Learning)

Easiest way to get started:

```bash
# Run Jenkins in a Docker container
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts

# Get initial admin password
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Then:
1. Open `http://localhost:8080` in browser
2. Enter the admin password
3. Install suggested plugins
4. Create admin user

### Option 2: Install Jenkins Locally

**Windows:**
1. Download Jenkins from https://www.jenkins.io/download/
2. Run the installer
3. Follow setup wizard

**Linux/Mac:**
```bash
# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
```

## Configure Jenkins for Your Blog

### Step 1: Install Required Plugins

1. Go to Jenkins → Manage Jenkins → Manage Plugins
2. Install these plugins:
   - **Git Plugin** (usually pre-installed)
   - **Pipeline Plugin** (usually pre-installed)
   - **Docker Pipeline Plugin**
   - **Blue Ocean** (optional, nice UI)

### Step 2: Configure Docker (if using Docker)

1. Go to Manage Jenkins → Configure System
2. Add Docker installation
3. Or ensure Docker is available on the Jenkins server

### Step 3: Create a Pipeline Job

1. Click "New Item"
2. Enter name: "Jekyll Blog Pipeline"
3. Select "Pipeline"
4. Click OK

### Step 4: Configure the Pipeline

1. **Pipeline Definition**: Select "Pipeline script from SCM"
2. **SCM**: Select "Git"
3. **Repository URL**: Your GitHub repo URL
   ```
   https://github.com/TaleOfFriendship/TaleOfFriendship.github.io.git
   ```
4. **Credentials**: Add your GitHub credentials (if private repo)
5. **Branch**: `*/master` (or your main branch)
6. **Script Path**: `Jenkinsfile` (the file we created)

### Step 5: Run the Pipeline

1. Click "Build Now"
2. Watch the pipeline execute
3. Click on the build number to see logs

## Pipeline Triggers

### Automatic Triggers

Add to your Jenkinsfile:

```groovy
pipeline {
    agent any
    
    // Trigger on Git push
    triggers {
        // Poll SCM every minute (checks for changes)
        pollSCM('H/1 * * * *')
        
        // Or use webhook (better - instant)
        // Requires GitHub plugin and webhook setup
    }
    
    // ... rest of pipeline
}
```

### Webhook Setup (Recommended)

1. Go to your GitHub repo → Settings → Webhooks
2. Add webhook:
   - **Payload URL**: `http://your-jenkins-server:8080/github-webhook/`
   - **Content type**: `application/json`
   - **Events**: Just the push event
3. Save

## Advanced: Multi-Branch Pipeline

For automatic builds on all branches:

1. Create "Multibranch Pipeline" instead of "Pipeline"
2. Configure to scan all branches
3. Jenkins will automatically create jobs for each branch with a Jenkinsfile

## Monitoring and Notifications

### View Build Status

- **Blue Ocean**: Modern UI for Jenkins
- **Classic View**: Traditional Jenkins interface
- **Build History**: See all past builds

### Add Notifications

```groovy
post {
    success {
        // Send email
        emailext (
            subject: "Build Success: ${env.JOB_NAME} - ${env.BUILD_NUMBER}",
            body: "Build succeeded!",
            to: "your-email@example.com"
        )
    }
    failure {
        emailext (
            subject: "Build Failed: ${env.JOB_NAME} - ${env.BUILD_NUMBER}",
            body: "Build failed! Check logs.",
            to: "your-email@example.com"
        )
    }
}
```

## Troubleshooting

### Jenkins can't find Docker

```groovy
// Add Docker path in Jenkinsfile
environment {
    PATH = "/usr/bin:/usr/local/bin:${env.PATH}"
}
```

### Permission denied errors

```bash
# Add Jenkins user to docker group (Linux)
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

### Build fails with "command not found"

- Ensure all required tools are installed on Jenkins server
- Or use Docker containers for isolated environments

## Next Steps

1. **Set up Jenkins** using one of the options above
2. **Create the pipeline** using the Jenkinsfile
3. **Test it** by running a build
4. **Add webhooks** for automatic triggers
5. **Customize** the pipeline for your needs

## Learning Resources

- [Jenkins Official Docs](https://www.jenkins.io/doc/)
- [Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [Jenkinsfile Examples](https://www.jenkins.io/doc/pipeline/examples/)

## Comparison: Jenkins vs. GitHub Actions

For this blog project:
- **GitHub Actions**: Already set up, easier, cloud-hosted
- **Jenkins**: Great for learning, more control, self-hosted

You can use both! They serve the same purpose but have different strengths.

