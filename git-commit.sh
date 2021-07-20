#!/bin/bash

GIT='git --git-dir='$PWD'/.git'

$GIT add .
$GIT commit -m "$2"
$GIT push origin "$1"