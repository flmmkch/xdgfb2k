#!/bin/bash

EXECUTABLE="$(dirname $0)/foobar2000.exe"
CMD="wine $EXECUTABLE"

item=0
ARGS=( "$@" )
for arg in "${ARGS[@]}"
do
    wineargs[$item]="$(winepath -w "$arg")"
    item=$(( $item + 1 ))
done

$CMD "${wineargs[@]}"
