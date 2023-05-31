pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yash2880/bash2.git'
            }
        }
        
        stage('Copy to Remote Server') {
            steps {
                script {
                    sshPublisher(publishers: [
                        sshPublisherDesc(configName: 'coe server', transfers: [
                            sshTransfer(cleanRemote: false, excludes: '', execCommand: "cat scp.sh | bash", execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'kafka-docker.sh')
                        ], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)
                    ])
                }
            }
        }
        
        stage('Execute on Remote Server') {
            steps {
                script {
                    sshPublisher(publishers: [
                        sshPublisherDesc(configName: 'coe server', transfers: [
                            sshTransfer(cleanRemote: false, excludes: '', execCommand: 'cat exec.sh | bash', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')
                        ], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)
                    ])
                }
            }
        }
    }
}
