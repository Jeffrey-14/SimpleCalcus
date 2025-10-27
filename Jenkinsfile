pipeline {
    agent any

    environment {
        PROJECT = "/Users/nanayaw/Downloads/SimpleCalcus/SimpleCalcus.xcodeproj"
        SCHEME = "SimpleCalcus"
        DESTINATION = "platform=iOS Simulator,name=iPhone 17,OS=26.0"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/CalculatorApp.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building iOS app..."
                sh """
                    xcodebuild clean build \
                    -project "$PROJECT" \
                    -scheme "$SCHEME" \
                    -destination '$DESTINATION' | xcpretty
                """
            }
        }

        stage('Test') {
            steps {
                echo "Running XCTest automation..."
                sh """
                    xcodebuild test \
                    -project "$PROJECT" \
                    -scheme "$SCHEME" \
                    -destination '$DESTINATION' | xcpretty --report junit --output build/reports/results.xml
                """
            }
            post {
                always {
                    junit 'build/reports/results.xml'
                }
            }
        }
    }
}

