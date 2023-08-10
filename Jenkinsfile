pipeline {
    agent {
        node { label 'azure-ubuntu' }
    }

    options {
        timestamps()
        buildDiscarder(logRotator(artifactNumToKeepStr: '5'))
    }

    stages {
        stage ('TEST') {
            steps {
                sh "echo 'Hello $USER'"
                sh "java --version"
                sh "docker --version"
                sh "git --version"
		sh "tree"
            }
        }
    }
}
