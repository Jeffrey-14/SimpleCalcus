pipeline {
    agent any

    environment {
        PROJECT = "/Users/nanayaw/Downloads/SimpleCalcus/SimpleCalcus.xcodeproj"
        SCHEME = "SimpleCalcus"
        DESTINATION = "platform=iOS Simulator,name=iPhone 16,OS=18.0" // Adjust based on Step 2
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Jeffrey-14/SimpleCalcus.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building iOS app..."
                sh """
                    xcodebuild clean build \
                    -project "\${PROJECT}" \
                    -scheme "\${SCHEME}" \
                    -destination "\${DESTINATION}" \
                    -allowProvisioningUpdates
                """
            }
        }

        stage('Test') {
            steps {
                echo "Running XCTest automation..."
                sh """
                    xcodebuild test \
                    -project "\${PROJECT}" \
                    -scheme "\${SCHEME}" \
                    -destination "\${DESTINATION}" \
                    -allowProvisioningUpdates \
                    -resultBundlePath TestResults.xcresult
                """
            }
            post {
                always {
                    archiveArtifacts artifacts: 'TestResults.xcresult/**', allowEmptyArchive: true
                }
            }
        }
    }

    post {
        success {
            echo 'Build and tests completed successfully!'
        }
        failure {
            echo 'Build or tests failed. Check console output for details.'
        }
    }
}
