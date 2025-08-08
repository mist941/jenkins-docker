pipelineJob('hello-world') {
  definition {
    cps {
      script("""
        pipeline {
          agent any
          stages {
            stage('Hello') {
              steps { echo 'Hello from JCasC-managed Jenkins!' }
            }
          }
        }
      """.stripIndent())
      sandbox()
    }
  }
}