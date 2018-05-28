pipeline {
	agent any
	
	parameters {
        string(name: 'Greeting', defaultValue: 'Hello', description: 'How should I greet the world?')
    }
	
	tools {
		maven 'Maven'
		jdk 'java8'
	}
	
	stages {
		stage ('Initialize') {
			steps {
				
				sh	'echo "Path = $Path"'
				sh	'echo "M2_HOME = $M2_HOME"'
				
			}
		}
		
		stage ('Build') {
			steps {
				sh 'mvn clean install'
				sh 'echo "${params.Greeting} World!"'
			}
			
			post {
				success {
					junit 'exclude-resources-demo/target/surefire-reports/*.xml'
				}
			}
		}
	}
}