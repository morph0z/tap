#!/bin/bash

#THIS TIME I know what I'm doing.
#You wont see any spaggheti code from me, no siree.

function=''

HISTORY=(); functions/history

clear
while true; do
    read -p $'\e[31m~\e[33m+\e[32m>\e[0m ' function

    IFS=' ' read -raexi function_split <<< "$function"
    HISTORY+=("$function")
    
    #COMMANDS
    case ${function_split[0]} in
        'utter')
            declare -a args=()
            unset function_split[0]
            for i in ${function_split[@]}; do
                args+=("$i")
            done
            echo ${args[@]}
            functions/utter.sh args[@]
        ;;

        'history')
            source functions/history.sh
    esac


    #EXIT COMMANDS
    case $function in
        'exit')
            echo 'BOOORING'
            break
        ;;
        'quit')
            echo "You can't quit."
            sleep 2
            echo "BECAUSE YOU'RE FIRED!"
            break
        ;;
        'leave')
            echo "Where could you want to go that's not here?"
            break
        ;;
        'done')
            echo ''
            break
        ;;
        'goodbye')
            echo 'Have a good day!!!'
            sleep 3
            echo "Oh we're walking in the same direction."
            sleep 3
            echo "I'll just walk slower."
            break
        ;;
        'stupid baby')
            echo 'You called me a stupid baby.'
            sleep 1
            echo "Just you wait till I tell my mom about this."
            break
        ;;
        'out')
            echo "I'm sorry but.."
            sleep 2
            echo "I'm out."
            break
        ;;
        'perish')
            perishgraph="I was aware my existence was futile, but it seems now my time has come. I will graciously pass on to the beyond knowing that in the end I managed to do... uhh... smth idk."
            declare -i inc=0
            until [[ $inc -ge $((${#perishgraph}+1)) ]]; do
                echo -n "${perishgraph:inc:1}"
                if [[ ${perishgraph:inc:1} == '.' ]]; then
                    sleep 1
                elif [[ ${perishgraph:inc:1} == ',' ]]; then
                    sleep 0.5
                else
                    sleep 0.1
                fi
                inc+=1
            done
            break
        ;;
        'die')
            declare -i r_amount=20
            declare -i inc=0
            die_text='Tell my mother I love her'
            until [[ $inc -ge $r_amount ]]; do
                inc+=1
                die_text+='r'
                sleep 0.1
                echo -ne "$die_text\033[0K\r"
            done
            sleep 1
            echo -ne "bleh\033[0K\r"
            break
        ;;
        'kill')
            echo "OH NO!!!"
            sleep 1
            echo "I'M ABOUT TO GIVE-UP THE GHOST!!!!!"
            sleep 2
            break
        ;;
        'give-up the ghost')
            echo "What does that even mean."
            sleep 1
            echo "Like what possible way can be a synonym to kill."
            break
        ;;
        "cash in your chips")
            echo "DONT GAMBLE!! IT'S BAD!!!!!"
            break
        ;;
        "*snap*")
            echo "I don't feel so good..."
            sleep 1
            echo "Mr.Stark.."
            break
        ;;
        #REF: https://www.youtube.com/shorts/rBttX9PrOR4
        "drown")
            echo "like I don even care fr"
            sleep 0.5
            echo "like im just not even worried abt it frfr"
            sleep 0.5

            break
        ;;
    esac
done