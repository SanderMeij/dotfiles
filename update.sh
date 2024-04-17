#!/bin/bash

xargs brew install < brew_leaves

# Define your function
process_file() {
    output=$(dirname $1)/$(basename $1 ".pkl")
    pkl eval $1 -o $output
}

export -f process_file

# Find files and execute the function on each file
find . -name "*.*.pkl" -type f -exec bash -c 'process_file "$0"' {} \;

stow .
