@Library('my-shared-library') _
pipeline{

    agent any

    parameters{
        choice(name: 'action', choices:'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'AppName', description: "name of the Application", defaultValue: 'springboot')
    }  
    stages{
        stage('Git Checkout'){
             when { expression{ params.action == 'create'}}
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/VictorVanhoorenHogent/DevOpsMavenTestProject.git"
            )         
            }
        }

         stage('Unit test maven'){
         when { expression{ params.action == 'create'}}
            steps{
                script{
                    mvnTest()
                }       
            }
        }

        stage('Integration Test maven'){
        when { expression{ params.action == 'create'}}
            steps{
                script{
                    mvnIntegrationTest()
                }       
            }
        }  

        stage('Static code analysis: Sonarqube'){
        when { expression{ params.action == 'create'}}
            steps{
                script{
                    def SonarqubecredentialId = 'sonar-api'
                    staticCodeAnalysis(SonarqubecredentialId)
                }       
            }
        } 

        stage('Quality Gate Status Check: Sonarqube'){
        when { expression{ params.action == 'create'}}
            steps{
                script{
                    def SonarqubecredentialId = 'sonar-api'
                    QualityGateStatus(SonarqubecredentialId)
                }       
            }
        }

        stage('Maven Build: maven'){
        when { expression{ params.action == 'create'}}
            steps{
                script{
                    mvnBuild()
                }       
            }
        }

        stage('Docker Image Build'){
        when { expression{ params.action == 'create'}}
            steps{
                script{
                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.AppName}")
                }       
            }
        }                                                                   
    }
}