#! /bin/bash

git config --global credential.helper cache
git config --global credential.helper 'cache -timeout=1000000'
