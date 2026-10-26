pipeline {
    agent any

    stages {
        stage('Fetch Code') {
            steps {
                echo '=== Fetching Repository Code from GitHub ==='
                git branch: 'main', url: 'https://github.com/Raviksharma2005/exam-engine.git'
                bat 'git status'
            }
        }

        stage('Static Analysis') {
            steps {
                echo '=== Running Static Analysis & Config Verification ==='
                bat '''
                    echo Verifying exam.properties configuration...
                    findstr "AUTO_EVAL=ON" exam.properties
                    if %ERRORLEVEL% NEQ 0 (
                        echo Error: AUTO_EVAL is not set to ON
                        exit /b 1
                    )
                    echo Static analysis and configuration checks passed successfully.
                '''
            }
        }

        stage('Containerize') {
            steps {
                echo '=== Building Docker Container Artifact ==='
                bat 'docker build -t exam-proctor:1.0 .'
                echo 'Docker build completed successfully.'
            }
        }
    }

    post {
        always {
            echo '=== Pipeline Execution Completed ==='
        }
        success {
            echo 'Status: All stages executed with success.'
        }
        failure {
            echo 'Status: Pipeline build failed.'
        }
    }
}
