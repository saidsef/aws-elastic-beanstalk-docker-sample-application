#!/usr/bin/env groovy

node("spot") {
  properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '5')), disableConcurrentBuilds(), pipelineTriggers([[$class: 'GitHubPushTrigger']])])
  stage("Checkout") {
    checkout scm
  }
  stage("Build") {
    sh "./build.sh ${env.BUILD_ID}"
  }
}
