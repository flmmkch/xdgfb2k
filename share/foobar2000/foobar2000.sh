#!/bin/bash

FOOBAR_DIR="$(readlink -e $(dirname $0))"
export WINEPREFIX="$FOOBAR_DIR/wineprefix"
EXECUTABLE="$FOOBAR_DIR/foobar2000.exe"
WINE="wine"
CMD="$WINE $EXECUTABLE"

item=0
ARGS=( "$@" )
for arg in "${ARGS[@]}"
do
    wineargs[$item]="$(winepath -w "$arg")"
    item=$(( $item + 1 ))
done

cd "$FOOBAR_DIR"
$CMD "${wineargs[@]}"
