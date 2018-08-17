#!/bin/bash
echo "Running rubocop"
rubocop --auto-correct
echo "Starting server"
rails s 
