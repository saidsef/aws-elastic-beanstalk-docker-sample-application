#!/usr/bin/env groovy

node("spot") {
  properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '5')), disableConcurrentBuilds(), pipelineTriggers([[$class: 'GitHubPushTrigger']])])
  stage("Checkout") {
    git({ poll: true, url: 'https://github.com/saidsef/alpine-jenkins-dockerfile-demo'})
  }
  stage("Build") {
    sh "./build.sh ${env.BUILD_ID}"
  }
}
