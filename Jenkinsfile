pipeline {
    agent any 
    stages {
        stage('build') {
            steps {
                sh 'docker build -t gary/mkdocs .' 
            }
        }
        stage('test') {
            steps {
                echo 'The image can build a mkdocs project into a tarball'
                sh 'docker run --name mkdocs-build --rm -i -v $PWD/test-project:/mkdocs_project  gary/mkdocs build > site.tar.gz' 
                echo 'There is a index.html at the root of the tarball'
                sh 'tar -tf site.tar.gz |grep "^./index.html$"'
                echo 'The image can serve the tarball as a website'
                sh '''
                    docker run --name mkdocs-serve --rm -p 8000:8000 -v $PWD/site.tar.gz:/mkdocs_tarball/site.tar.gz gary/mkdocs serve &
                    sleep 3
                    curl http://localhost:8000
                '''    
            }
        }
    }
    post {
        always {
            echo 'Kill the web server container'
            sh 'docker kill mkdocs-serve || true'
        }
    }
}