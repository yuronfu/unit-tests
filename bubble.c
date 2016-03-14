#include "swap.c"

void bubble_sort(List **head)
{
    if (head == NULL || (*head == NULL))
        return;

    List *last_head = NULL;
    List *sub_head;

    sub_head = *head;

    while(sub_head != last_head) {

        for ( ; sub_head->next != last_head  ; ) {
            if (sub_head->value < sub_head->next->value) {
                *head = swap(*head,sub_head,sub_head->next);
                
            }
            else sub_head = sub_head->next;
        }

        last_head = sub_head;
        sub_head = *head;
    }

    return;
}
