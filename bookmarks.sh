#!/bin/bash


CONF=$HOME/.bookmarks.conf
VI=nvim
DIR=$HOME
declare -A BOOKMARKS
declare -a KEYS

# Read bookmarks file
while IFS=":"  read -r key value; do
    BOOKMARKS[$key]=$value
    KEYS+=($key)
done < <( grep -vE '^(\s*$|#)' $CONF )

# Construct menu
clear

echo

for k in "${KEYS[@]}"
do
    echo "[ $k ] : ${BOOKMARKS[$k]}"
done

echo

# Reach choice
echo  -e "Enter your choice : \c "; read choice

# cd and open vi if array key exists
if [[ -v BOOKMARKS[$choice] ]]; then
    cd ${DIR}/${BOOKMARKS[$choice]} && $VI
fi


exit 0
