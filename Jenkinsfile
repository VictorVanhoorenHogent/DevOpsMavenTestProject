@Library('my-shared-library') _
pipeline{

    agent any

    stages{
         
        stage('Git Checkout'){
                    when { expression {  params.action == 'create' } }
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/VictorVanhoorenHogent/DevOpsMavenTestProject.git"
            )         
            }
        }

         stage('Unit test maven'){
                    when { expression {  params.action == 'create' } }
            steps{
                script{
                    

                }       
            }
        }       
    }
}