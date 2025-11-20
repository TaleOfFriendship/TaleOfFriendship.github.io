// Jenkins Pipeline for Jekyll Blog
// This is a declarative pipeline that builds and tests your Jekyll site

pipeline {
    // Agent: Where the pipeline runs
    // 'any' means it can run on any available Jenkins agent/node
    agent any
    
    // Environment variables available to all stages
    environment {
        // Path to the docs directory
        DOCS_DIR = 'docs'
        // Ruby version (should match your Gemfile)
        RUBY_VERSION = '3.1'
    }
    
    // Stages define the steps of your CI/CD pipeline
    stages {
        // Stage 1: Checkout code from Git
        stage('Checkout') {
            steps {
                echo 'Checking out code from Git...'
                // Checkout code from the repository
                checkout scm
            }
        }
        
        // Stage 2: Set up Ruby environment
        stage('Setup Ruby') {
            steps {
                echo 'Setting up Ruby environment...'
                script {
                    // Use Docker to get a consistent Ruby environment
                    // This ensures the same Ruby version across all builds
                    sh '''
                        docker run --rm -v $(pwd):/workspace -w /workspace ruby:${RUBY_VERSION} \
                        bash -c "gem install bundler && cd ${DOCS_DIR} && bundle install"
                    '''
                }
            }
        }
        
        // Stage 3: Build the Jekyll site
        stage('Build') {
            steps {
                echo 'Building Jekyll site...'
                script {
                    sh '''
                        docker run --rm -v $(pwd):/workspace -w /workspace ruby:${RUBY_VERSION} \
                        bash -c "cd ${DOCS_DIR} && bundle exec jekyll build"
                    '''
                }
            }
        }
        
        // Stage 4: Test the build output
        stage('Test') {
            steps {
                echo 'Testing build output...'
                script {
                    sh '''
                        # Check that index.html was created
                        if [ ! -f ${DOCS_DIR}/_site/index.html ]; then
                            echo "ERROR: index.html not found!"
                            exit 1
                        fi
                        
                        # Check that at least one post was generated
                        if [ ! -d "${DOCS_DIR}/_site/20220705_dummy_encoding" ]; then
                            echo "WARNING: Expected post directory not found"
                        fi
                        
                        echo "✓ Build output verified successfully"
                    '''
                }
            }
        }
        
        // Stage 5: Build Docker image (optional)
        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                script {
                    dir("${DOCS_DIR}") {
                        sh '''
                            docker build -t jekyll-blog:${BUILD_NUMBER} .
                            docker tag jekyll-blog:${BUILD_NUMBER} jekyll-blog:latest
                        '''
                    }
                }
            }
        }
        
        // Stage 6: Test Docker image
        stage('Docker Test') {
            steps {
                echo 'Testing Docker image...'
                script {
                    sh '''
                        # Start container in background
                        docker run -d -p 4000:4000 --name jekyll-test-${BUILD_NUMBER} jekyll-blog:latest
                        
                        # Wait for Jekyll to start
                        sleep 15
                        
                        # Test that the site is accessible
                        if curl -f http://localhost:4000; then
                            echo "✓ Docker container test passed"
                        else
                            echo "✗ Docker container test failed"
                            exit 1
                        fi
                        
                        # Clean up
                        docker stop jekyll-test-${BUILD_NUMBER}
                        docker rm jekyll-test-${BUILD_NUMBER}
                    '''
                }
            }
        }
    }
    
    // Post-actions: Run after all stages (success or failure)
    post {
        // Always run cleanup
        always {
            echo 'Cleaning up...'
            script {
                sh '''
                    # Remove any leftover test containers
                    docker ps -a | grep jekyll-test | awk '{print $1}' | xargs -r docker rm -f || true
                '''
            }
        }
        
        // On success
        success {
            echo 'Pipeline succeeded! ✓'
            // You could add notifications here (email, Slack, etc.)
        }
        
        // On failure
        failure {
            echo 'Pipeline failed! ✗'
            // You could add error notifications here
        }
    }
}

