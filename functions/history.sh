#!/bin/bash

if [[ "${#HISTORY[@]}" -eq 1 ]]; then
    echo "I forgor"
else
    for ((i=0; i<"${#HISTORY[@]}"; i++)); do
        echo "$i ${HISTORY[i]}"
    done
fi