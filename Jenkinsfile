@Library('my-shared-library') _
pipeline{

    agent any

    parameters{
        choice(name: 'action', choices:'create\ndelete', description: 'Choose create/Destroy')
    }
    when { expression{ param.action == 'create'}}
    stages{
         
        stage('Git Checkout'){
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/VictorVanhoorenHogent/DevOpsMavenTestProject.git"
            )         
            }
        }

         stage('Unit test maven'){
         when { expression{ param.action == 'create'}}
            steps{
                script{
                    mvnTest()
                }       
            }
        }

        stage('Integration Test maven'){
        when { expression{ param.action == 'create'}}
            steps{
                script{
                    mvnIntegrationTest()
                }       
            }
        }  

        stage('Static code analysis: Sonarqube'){
        when { expression{ param.action == 'create'}}
            steps{
                script{
                    staticCodeAnalysis()
                }       
            }
        }                       
    }
}