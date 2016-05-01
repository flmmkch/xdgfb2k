#!/bin/bash

EXECUTABLE="$(dirname $0)/foobar2000.exe"
CMD="wine $EXECUTABLE"

items=0
for arg in "$@"
do
    wineargs[items]="$(winepath -w "$arg")"
    items=$(( $items + 1 ))
done

$CMD $wineargs
