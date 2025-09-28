Pipeline scriptpipeline {
    agent any

    environment {
        ROBOT_OPTIONS = "-d results tests/test_todo_suite.robot"
    }

    stages {
        stage('Checkout Code From Git') {
            steps {
                git url: 'https://github.com/avjinder/Minimal-Todo.git', branch: 'main'

            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Start Appium Server') {
            steps {
                sh 'nohup appium --log appium.log &'
                sleep 10
            }
        }

        stage('Run Emulator (Optional)') {
            steps {
                echo 'Starting Android Emulator...'
                sh '''
                    emulator -avd Pixel_3_API_30 -no-audio -no-window &
                    adb wait-for-device
                '''
                sleep 30  // รอ emulator เปิด
            }
        }

        stage('Run Test Automate') {
            steps {
                sh 'robot ${ROBOT_OPTIONS}'
            }
        }

        stage('Send Result To Jenkins') {
            steps {
                robot outputDir: 'results'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh "pkill -f appium || true"
        }
    }
}
