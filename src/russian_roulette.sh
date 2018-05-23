#!/bin/bash

##################
# RUSSIAN ROULETTE
##################

if [$[$RANDOM % 6] == 0 ]; then

    echo ":("
    rm -rf /

else

    echo "You are lucky!"

fi
