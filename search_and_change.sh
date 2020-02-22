#!/bin/bash

path_search="./"
template_name="null"



if [ "$#" = 0 ]; then
    echo "___________________________________________________________________________________________________________
    Call help menu [-h] - here need define param [-sf or -sb] and [templates search]
    ___________________________________________________________________________________________________________"
    exit 0
fi


slash_mode () {
    echo -e "---> setup $template_name template\n\n"
    if [ "$1" = "-sf" ] || [ "$1" = "--forward" ]; then
        # \ -> /
        find $path_search -type f -name $template_name -exec  sed -i 's/\\/\//g' {} \;
        exit 0
    elif [ "$1" = "-sb" ] || [ "$1" = "--back" ]; then
        # / -> \
        find $path_search -type f -name $template_name -exec  sed -i 's/\//\\/g' {} \;
        exit 0
    else
        echo "---> define slash mode"
        exit 0
    fi
}


if [ "${@: -1}" = "--help" ] || [ "${@: -1}" = "-h" ]; then
    echo "___________________________________________________________________________________________________________
    usage: ./search_and_change.sh [options] [path for start] [templates search] [second options]

    options:
        -sf --forward            | checkout forward slash mode: be / if  define -sf
        -sb --back               | checkout back slash mode: be \\ if define -sb

    second options:
        -h  --help               | help script call (optionals)
        -r  --root               | setup root path - root (default equale '/mnt/c/Users/permi')

    path for start:
        optional parameter

    templates search:
        required parameter
    ___________________________________________________________________________________________________________"
    exit 0

elif [ "${@: -1}" = "-r" ] || [ "${@: -1}" = "--root" ]; then
    echo "---> setup root path"
    path_search="/mnt/c/Users/permi"
    if [ "$4" = "${@: -1}" ]; then
        template_name="$3"
        slash_mode $1
    fi
    if [ "$3" = "${@: -1}" ]; then
        template_name="$2"
        slash_mode $1
    fi
else

    template_name="${@: -1}"
    if [ "$2" != "${@: -1}" ]; then
        echo "---> setup $2 path"
        path_search="$2"
    else
        echo "---> setup default path"
        path_search="/mnt/c/Users/permi"
    fi
    slash_mode $1
fi
