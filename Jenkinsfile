#!/usr/bin/env groovy

node("spot") {
  properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '5', numToKeepStr: '5')), disableConcurrentBuilds(), pipelineTriggers([[$class: 'GitHubPushTrigger']])])
  stage("Checkout") {
  checkout([$class: 'GitSCM', branches: [[name: '**']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[]]])
  }
  stage("Build") {
    sh "./build.sh ${env.BUILD_ID}"
  }
}
