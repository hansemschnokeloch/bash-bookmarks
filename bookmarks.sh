#!/bin/bash

# colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LGRAY='\033[0;37m'
DGRAY='\033[1;30m'
LRED='\033[1;31m'
LGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LBLUE='\033[1;34m'
LPURPLE='\033[1;35m'
LCYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

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
    echo -e "[ $YELLOW$k$NC ] : $LGREEN${BOOKMARKS[$k]}$NC"
done

echo

# Reach choice
echo  -e "Enter your choice : \c "; read choice

# cd and open vi if array key exists
if [[ -v BOOKMARKS[$choice] ]]; then
    cd ${DIR}/${BOOKMARKS[$choice]} && $VI
fi


exit 0
