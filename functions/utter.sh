#!/bin/bash

#TODO: fix utter, make d flag for deltarune type text
#make a thing to put yellow text on some words.

d_flag=false

declare -a first
#https://stackoverflow.com/users/nicholas-sushkin nicholas seems like a really cool guy
function join_by { local IFS="$1"; shift; echo "$*"; }

TEMP=$(getopt -o d:: -- "$@")
while true ; do
    case "$1" in
        -d)
            d_flag=true
            shift 1
            first=("${@}")
            break
        ;;
        *) 
            first=("${@}")
            break
        ;;
    esac
done


yellowing_text=false
if [[ $d_flag == true ]]; then
    text=${first[@]}

    declare -i inc=0
    until [[ $inc -ge $((${#text}+1)) ]]; do
        if [[ ${text:inc:3} == "<y|" ]]; then
            inc+=2
            echo -n $'\e[33m'
            yellowing_text=true
        elif [[ ${text:inc:2} == "|>" ]]; then
            if [[ $yellowing_text == true ]]; then
                inc+=1
                echo -n $'\e[0m'
                yellowing_text=false
            fi
        else           
            echo -n "${text:inc:1}"
        fi


        if [[ ${text:inc:1} == '.' ]]; then
            sleep 1
        elif [[ ${text:inc:1} == ',' ]]; then
            sleep 0.5
        else
            sleep 0.1
        fi
        inc+=1
    done
    echo 

else
    echo ${first[@]}
fi