#!/bin/bash

if [[ ! -n $1 || ! -n $2 ]];then
    echo "Error:you should input two dir!"
    exit
fi

# get diff files list (use '|' sign a pair of files)
diff_file_list_str=`diff -ruNaq $1 $2 | awk '{print $2 " " $4 "|"}'`;

# split list by '|'
OLD_IFS="$IFS"
IFS="|"
diff_file_list=($diff_file_list_str)
IFS="$OLD_IFS"

# use vimdiff compare files from diff dir
i=0
while [ $i -lt ${#diff_file_list[*]} ]
do
   vimdiff ${diff_file_list[$((i++))]}
done
