#!/bin/sh
# source of input params skelelon http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# Initialize our own variables:
default_activities_dir="../menu.d"
activity_id=""
menu_items=`ls ${default_activities_dir}`

action="none"

while [[ $# -ge 1 ]]
do

    key="$1"
    shift

    case $key in
        -l|--list)
            action="list";
            shift
        ;;
        -a|--activity)
            action="execute";
            activity_id="$1";
        shift
        ;;
    #    -l|--lib)
    #    LIBPATH="$1"
    #    shift
    #    ;;
    #    --default)
    #    DEFAULT=YES
    #    shift
    #    ;;

        *)
                # unknown option
        ;;
    esac
done

if [ "$action" == "list" ]; then
    echo "Menu:"

    counter=0;
    for i in $menu_items; do
        counter=`expr $counter + 1`;
        echo "$counter. $i";
    done;
elif [ "$action" == "execute" ]; then
    counter=0;
    for i in $menu_items; do
        counter=`expr $counter + 1`;
        if [ "$counter" == "$activity_id" ]; then
            echo "Switching activity to: $i";
            eval "./$default_activities_dir/$i";
            echo "Activity set successfully.";
            echo "Done";
        fi
    done;
fi

#echo FILE EXTENSION  = "${EXTENSION}"
#echo SEARCH PATH     = "${SEARCHPATH}"
#echo LIBRARY PATH    = "${LIBPATH}"
#echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
#if [[ -n $1 ]]; then
#    echo "Last line of file specified as non-opt/last argument:"
#    tail -1 $1
#fi