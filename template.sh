#!/usr/bin/env bash

# Get a new file name
# Get the file type from the name
IFS='.'
read -a tokens <<< "$1"

if [[ ${#tokens[@]} -ne 2 ]]
then
    echo "$1 is not a valid file name. Make sure your input is written as [NAME].[EXTENSION] (e.g. hi_mum.txt)"
else
    extension="${tokens[1]}"
    selected=`find ~/Documents/Templates -type f -name *."$extension" | fzf`
    cp "$selected" "$PWD"
    mv "$PWD/${selected##*/}" "$PWD/$1"
    echo "$1 has been created from template ${selected##*/}"
fi
