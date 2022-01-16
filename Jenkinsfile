pipeline {
    agent any
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://https://github.com/shelke1234/CI-CD-using-Docker.git'
             
	   }
        
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t myhub:latest .' 
                sh 'docker tag myhub dhananjayshelke/myhub:latest'
                //sh 'docker tag myhub dhananjayshelke/myhub:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dhananjayshelke", url: "" ]) {
          sh  'docker push dhananjayshelke/myhub:latest'
        //  sh  'docker push dhananjayshelke/myhub:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 dhananjayshelke/myhub"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@13.127.10.243 run -d -p 8003:8080 dhananjayshelke/myhub"
 
            }
        }
    }
	}
    
