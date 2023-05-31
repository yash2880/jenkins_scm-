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
                            sshTransfer(cleanRemote: false, excludes: '', execCommand: "scp -i id_rsa kafka-docker.sh yashwanth.s@192.168.7.17:/home/yashwanth.s/.", execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'kafka-docker.sh')
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
                            sshTransfer(cleanRemote: false, excludes: '', execCommand: 'bash kafka-docker.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')
                        ], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)
                    ])
                }
            }
        }
    }
}
