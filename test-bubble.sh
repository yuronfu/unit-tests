#!/bin/bash

echo 'b main' >> bubble_tmp.gdb
echo 'r' >>  bubble_tmp.gdb
echo 'source scripts/create_list.gdb' >> bubble_tmp.gdb
echo 'source scripts/print_list.gdb' >>  bubble_tmp.gdb
echo 'source scripts/free_list.gdb' >>  bubble_tmp.gdb

echo 'set $head = (List**)malloc(sizeof(List*))' >>  bubble_tmp.gdb

echo 'set logging file '$2>> bubble_tmp.gdb

echo ' '>>$2
exec < $1

while  (read var) 
do
	read var
	list_length=$var

	echo 'create_list (*($head)) '$list_length >>  bubble_tmp.gdb
	read var
	list_value=($var)

	echo 'set $_head = (*($head))' >>  bubble_tmp.gdb

	for value in "${list_value[@]}"
	do
		echo 'p $_head->value = '$value >>  bubble_tmp.gdb
		echo 'p $_head = $_head->next' >>  bubble_tmp.gdb
	done

	echo 'set logging on' >>  bubble_tmp.gdb
	echo 'p "test begin"' >>  bubble_tmp.gdb
	echo 'p "old_list"' >>  bubble_tmp.gdb
	echo 'printf_list (*($head))' >>  bubble_tmp.gdb
	echo 'set logging off' >>  bubble_tmp.gdb
	echo 'p bubble_sort($head)' >>  bubble_tmp.gdb
	echo 'set logging on' >>  bubble_tmp.gdb
	echo 'p "new_list"' >>  bubble_tmp.gdb
	echo 'printf_list (*($head))' >>  bubble_tmp.gdb

	echo 'set logging off' >>  bubble_tmp.gdb
	echo 'free_list (*($head))' >>  bubble_tmp.gdb
done

echo 'q' >>  bubble_tmp.gdb
echo 'y' >>  bubble_tmp.gdb

gdb -q -x  bubble_tmp.gdb bin-bubble >>/dev/null

rm  bubble_tmp.gdb
