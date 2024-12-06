pipeline {
    agent any

    stages {
        stage('Clean env') {
            steps {
                sh "ls Formation && rm -rf Formation || echo ok"
            }
        }
        stage('Get Source') {
            steps {
                sh 'git clone "https://github.com/ismailmengad/Formation"'
            }
        }
        stage('Compile') {
            steps {
                sh 'cd Formation && gcc hello.c -o hello'
            }
        }
        stage('Launch') {
            steps {
                sh 'cd Formation && ./hello'
            }
        }
    }
}
