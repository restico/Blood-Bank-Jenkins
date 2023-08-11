pipeline {
    agent {
        node { label 'azure-ubuntu' }
    }
    
    parameters {
        booleanParam(name: 'LOAD_DUMP', defaultValue: false, description: 'Should pipeline load dump into MySQL DB')
    }

    options {
        timestamps()
        buildDiscarder(logRotator(artifactNumToKeepStr: '5', numToKeepStr: '5'))
    }

    stages {
        stage('Load DB dump') {
            when { 
                expression { return params.LOAD_DUMP }
            }
            steps {
                sh '''if [[ -z $(mysql -e "SHOW DATABASES;" | grep blood_bank) ]]; then
                mysql -e "CREATE DATABASE blood_bank;"
                mysql blood_bank < src/sql/bloodbank.sql
                fi'''
            }
        }
	stage('Stop docker container') {
            steps {
		sh 'docker stop blood-bank-container'
		sh 'docker container prune -f'
            }
	}

	stage('Build and run docker container') {
	    steps {
		sh 'docker build -t blood-bank-image .'
		sh 'docker run -d -p 80:80 --name blood-bank-container blood-bank-image'
	    }
        }
    }
    
    post {
        success {
            sh 'docker image prune -af'
        }
    }
}
