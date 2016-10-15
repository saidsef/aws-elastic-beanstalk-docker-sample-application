#!/usr/bin/env groovy

node("spot") {
  properties([disableConcurrentBuilds(), pipelineTriggers([cron('*/20 * * * *')])])
  stage("Checkout") {
    checkout scm
  }
  stage("Build") {
    sh "./build.sh"
  }
}
