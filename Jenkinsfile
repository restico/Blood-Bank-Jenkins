pipeline {
    agent {
        node { label 'azure-ubuntu' }
    }

    options {
        timestamps()
        buildDiscarder(logRotator(artifactNumToKeepStr: '5'))
    }

    stages {
        stage('Configure project') {
            steps {
                sh 'src/file/generate-connection'
            }
	}
	stage('Build and run docker container') {
	    steps {
		sh 'docker build -t blood-bank-image .'
		sh 'docker run -d -p 80:80 blood-bank-image'
	    }
        }
    }
}
