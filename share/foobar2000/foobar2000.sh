#!/bin/bash

FOOBAR_DIR="$(dirname $0)"
EXECUTABLE="$FOOBAR_DIR/foobar2000.exe"
CMD="wine $EXECUTABLE"

item=0
ARGS=( "$@" )
for arg in "${ARGS[@]}"
do
    wineargs[$item]="$(winepath -w "$arg")"
    item=$(( $item + 1 ))
done

cd "$FOOBAR_DIR"
$CMD "${wineargs[@]}"
