node{
	stage('git checkout'){
		checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SIVAGIT12/new-nodejs.git']]])
	}
	stage('installing dependencies'){
		sh 'npm install'
	}
	stage('npm test'){
		sh 'npm run test'
	}
	stage('build'){
		sh 'npm run build'
	}
	stage('creating docker image'){
		sh 'docker build -t siva9948/nodeapp:1 .'
	}
	stage('login to dockerhub and push image '){
		sh 'docker login / docker login -u <username> -p <password>'
    sh 'push siva9948/nodeapp'
	}
}
