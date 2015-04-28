#!/bin/bash

make tests


RED="\x1B[0;31m"
GREEN="\x1B[0;32m"
BLUE="\x1B[1;34m"
NOCOLOR="\x1B[0m"
exit_code=1

for file in $(find tests/bin -maxdepth 1 -type f); do
    echo -e $BLUE "Testing " $file $NOCOLOR
    if ! valgrind --error-exitcode=1 $file $TEST_ARGS; then
        echo -e $RED "Error:" $file "leaking memory" $NOCOLOR 1>&2
        exit_code=1
    else
        echo -e $BLUE $file "passed" $NOCOLOR
    fi
    done

for file in $(find build/bin -maxdepth 1 -type f); do
    echo -e $BLUE "Testing " $file $NOCOLOR
    if ! valgrind --error-exitcode=1 $file $ARGS; then
        echo -e "Error: leaking memory"
        exit_code=1
    else
        echo -e $BLUE $file "passed" $NOCOLOR
    fi
done
exit $exit_code
