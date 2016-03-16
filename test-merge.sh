#!/bin/bash

exec 6>&1
exec > merge_tmp.gdb

echo 'b main'
echo 'r'
echo 'source scripts/create_list.gdb'
echo 'source scripts/print_list.gdb'
echo 'source scripts/free_list.gdb'

echo 'set logging file' $2

echo 'set $head = (List**)malloc(sizeof(List*))'

exec < $1
while(read var)
do
	read var
	list_num=$var
	echo 'create_list (*$head)' $list_num

	read var
	list_value=($var)
	
	echo 'set $_head = (*$head)'

	for value in ${list_value[@]}
	do
		echo 'p $_head->value = ' $value
		echo 'p $_head = $_head->next' 
	done

	echo 'set logging on'
	echo 'p "original order"'
	echo 'printf_list (*$head)'
	echo 'set logging off'

	echo 'p merge_sort($head)'

	echo 'set logging on'
	echo 'p "sorted order"'
	echo 'printf_list (*$head)'
	echo 'set logging off'

	echo 'free_list (*$head)'
done

echo 'q'
echo 'y'

exec 1>&6 6>&-

gdb -q -x merge_tmp.gdb ./bin-merge >>/dev/null

rm merge_tmp.gdb
