#!/usr/bin/env bash
## DancingQuanta/bash-config - https://github.com/DancingQuanta/bash-config
## From https://github.com/ek9/shell-config
## 80-taskwarrior.bash
## Taskwarrior aliases / functions
tickle() {
    if [[ "$1" =~ ^-?[0-9]+$ ]]; then
        # first argument is number - modify task
         task=$1; shift; due=$1; shift; task $task mod wait:$due gtd:tickler $@
    else
        # add new task
        dl=$1; shift; task add $@ gtd:tickler wait:$dl
    fi
}
delay() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "arguments: <FILTER> <TIME_AMOUNT>"
        echo "Tickle FILTERED tasks for TIME_AMOUNT"
    else
        task=$1; shift; wait=$1; shift;
        task $task mod wait:$wait gtd:tickler
    fi
}
someday() {
    [ ! -z "$1" ] && task add $@ gtd:someday eait:someday
}
alias in='task add gtd:inbox'
alias afk='task add gtd:inbox +afk'
alias tick="tickle"
alias think="tickle +1d"
alias learn="someday +learn"
alias tread="someday +read"
alias research="someday +reseach"
