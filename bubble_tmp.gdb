set logging file output.txt
Set logging on
b main
r
p $head = (List**)malloc(sizeof(List*))
p *$head = (List*)malloc(sizeof(List))
p $tmp = *$head
set $i = 0

While($i < 3)
	p $tmp->value = $i++
	p $tmp->next = (List*)malloc(sizeof(List))
	p $tmp = $tmp->next
end

p $tmp->value = $i
p $tmp->next = (List*)0
p bubble_sort($head)
p $tmp = *$head
set $j = 0

While($j < 4)
	p $tmp->value
	p $tmp = $tmp->next 
	set $j++
end

c
set logging off
q