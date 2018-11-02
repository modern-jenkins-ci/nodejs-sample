node('docker') {
    stage('Get Latest Code') {
        cleanWs()
        checkout scm

        // add debug to view GIT_COMMIT
        sh 'env'
    }

    stage('Pull NodeJs Code') {
        dir('node-todo') {
            git url: 'https://github.com/scotch-io/node-todo.git',
                branch: 'master'

            // add debug to view GIT_COMMIT
            sh 'env'
        }
    }

    stage('Build Docker Image') {
        docker.build(
            "modern-jenkins/node-todo:${env.BUILD_NUMBER}",
            "--squash --build-arg GIT_COMMIT=${env.GIT_COMMIT} ."
        )
    }
}