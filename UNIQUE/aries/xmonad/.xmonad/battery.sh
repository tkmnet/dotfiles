#!/bin/sh

acpi -b | sed 's/^.* \([[:digit:]]\+\)%.*$/\1/g' | awk '{b+=$1;c+=1} END{printf "%3d%\n", b/c}'
