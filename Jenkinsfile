#!/usr/bin/env groovy

node("spot") {
  job("DockerHub-build-node-webserver") {
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '5')), disableConcurrentBuilds(), pipelineTriggers([[$class: 'GitHubPushTrigger']])])
    stage("Checkout") {
      checkout scm
    }
    triggers {
      scm("*/20 * * * *")
    }
    stage("Build") {
      sh "./build.sh ${env.BUILD_ID}"
    }
  }
}
