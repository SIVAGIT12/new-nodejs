pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SIVAGIT12/new-nodejs.git']]])
            }
        }
        stage('installing dependencies'){
            steps{
                sh 'npm install'
            }
        }
        stage('build'){
            steps{
                sh 'npm run build'
            }
        }
        stage('create image'){
            steps{
                sh 'docker build -t siva9948/nodeapp:1 .'
            }
        }
        stage('push image to dockerhub'){
            steps{
                script{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
                sh 'docker login -u ${username} -p ${password}'
                
                sh 'docker push siva9948/nodeapp:1'
                    }
                }
            }
        }
        stage('k8s deployment'){
            steps{
                sh 'ssh ubuntu@172.31.3.214 kubectl apply -f deployment.yml'
                sh 'ssh ubuntu@172.31.3.214 kubectl apply -f service.yml'
                
            }
        }
    }
}
