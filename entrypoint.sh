#!/bin/sh

set -e

echo ARGS="$@"
repo_url=https://github.com/mattikus/lester-of-the-forest
hubot_dir=/run/lester

# Source Env Vars for Lester
[ -f /environment ] && . /environment

# Get the latest copy of lester
git clone --depth 1 $repo_url $hubot_dir

cd $hubot_dir
exec bin/hubot "$@"
