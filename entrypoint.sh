#!/bin/bash
set -e

bundle exec puma -C config/puma.rb
