#!/bin/bash

GIT='git --git-dir='$PWD'/.git'

$GIT checkout -b "$1"
echo 'Branch created' "$1"