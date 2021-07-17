#!/bin/bash

GIT='git --git-dir='$PWD'/.git'

$GIT config --global --unset user.email

$GIT config --global user.email "daniel.collier@tuna.uy"

cd /home/collier/tuna/gitlab

$SHELL