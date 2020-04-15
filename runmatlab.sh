#!/bin/bash
# simple shell script to run matlab script

if [ $# -eq 0 ]
  then
    echo "please pass local m script name, usage: ./runmatlab.sh <script_name>"
    exit 1
fi

matlab -nodisplay -nosplash -nodesktop -r "run('$(pwd)/$1');exit;"  | tail -n +11
