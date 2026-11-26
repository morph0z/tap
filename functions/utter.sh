#!/bin/bash

declare -a first=("${!1}")


#TODO: fix utter, make d flag for deltarune type text
#make a thing to put yellow text on some words.

d_flag=false
echo d_flag

if getopts 'd' flag; then
  case "${flag}" in
    d) 
        d_flag=true
    ;;
  esac
fi


#https://stackoverflow.com/users/nicholas-sushkin nicholas seems like a really cool guy
function join_by { local IFS="$1"; shift; echo "$*"; }

if [[ d_flag == true ]]; then
    text=join_by " " ${first[@]}

    declare -i inc=0
    until [[ $inc -ge $((${#text}+1)) ]]; do
        echo -n "${text:inc:1}"
        if [[ ${text:inc:1} == '.' ]]; then
            sleep 1
        elif [[ ${text:inc:1} == ',' ]]; then
            sleep 0.5
        else
            sleep 0.1
        fi
        inc+=1
    done
else
    echo ${first[@]}
fi