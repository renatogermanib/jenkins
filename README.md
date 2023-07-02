# jenkins
Repo for ci/cd cycle

This repository contains a Jenkins pipeline written in a Jenkinsfile. The pipeline includes three stages: Build, Test, and Deploy. Each stage consists of specific steps to perform certain actions.

## Pipeline Stages

### Build
This stage is responsible for compiling the source code of the application. It executes the following command:
```shell
javac -cp lib/junit-4.13.2.jar:lib/hamcrest-2.2.jar -sourcepath src -d build/classes src/MyApp.java src/com/example/MyAppTest.java

# Test
In this stage, the pipeline runs unit tests for the application. It executes the following command:

java -cp build/classes:lib/junit-4.13.2.jar:lib/hamcrest-2.2.jar org.junit.runner.JUnitCore com.example.MyAppTest

# Deploy
The Deploy stage is responsible for deploying the application to a test environment. It runs the deploy_script.sh using SSH:

ssh user@server "bash -s" < deploy_script.sh

# Execution
To execute the Jenkins pipeline, make sure to set up Jenkins with the proper configuration and add the required plugins. The pipeline is designed to work with any available agent.
