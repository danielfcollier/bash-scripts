#!/bin/bash

GIT='git --git-dir='$PWD'/.git'

$GIT config --global --unset user.email

$GIT config --global user.email "danielfcollier@gmail.com"

cd /home/collier/github

$SHELL