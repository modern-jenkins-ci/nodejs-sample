node('docker') {
    stage('Get Latest Code') {
        cleanWs()
        checkout scm
    }

    stage('Pull NodeJs Code') {
        dir('node-todo') {
            def gitInfo = git url: 'https://github.com/scotch-io/node-todo.git', branch: 'master'

            // set the git commit info on the environment
            if(gitInfo.GIT_COMMIT) {
                env.GIT_COMMIT = gitInfo.GIT_COMMIT
            }
        }
    }

    stage('Build Docker Image') {
        def builder
        if(env.http_proxy) {
            builder = docker.build(
                "modern-jenkins/node-todo:${env.BUILD_NUMBER}",
                "--build-arg GIT_COMMIT=${env.GIT_COMMIT} --build-arg http_proxy=${env.http_proxy} --build-arg https_proxy=${env.https_proxy} ."
            )
        } else {
            builder = docker.build(
                "modern-jenkins/node-todo:${env.BUILD_NUMBER}",
                "--build-arg GIT_COMMIT=${env.GIT_COMMIT} ."
            )
        }
    }
}