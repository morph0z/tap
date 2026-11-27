#!/bin/bash

week_day_yes=$(date -d "yesterday" +%A)
week_day_tod=$(date +%A)
curr_time=$(date '+%I +%p')

date_text1="Today is <y|$week_day_yes|>,, wait no, today,, today is <y|$week_day_tod|>, and it's <y|$curr_time|>... I think."

functions/utter.sh -d $date_text1