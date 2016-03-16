#include "swap.c"

List *merge(List *sub_head, List *mid_head)
{
    List *head = NULL,*node = NULL;

    // pick the head for merge list
    (sub_head->value < mid_head->value) ? (head =  mid_head) : (head = sub_head);
    List *tmp = head;
    while(sub_head && mid_head) {
        if(sub_head->value < mid_head->value) {
            node = mid_head;
            mid_head = mid_head->next;
        }
        else {
            node = sub_head;
            sub_head = sub_head->next;
        }
        tmp->next = node;
        tmp = tmp->next;
        tmp->next = NULL;
    }

    //append the rest part to the end
    if(sub_head) tmp->next = sub_head;
    if(mid_head) tmp->next = mid_head;

    return head;
}

void merge_sort(List **head)
{
    int i,list_num = 0;
    List *sub_head = NULL,*mid_head = NULL;

    //count list number
    sub_head = *head;
    while(sub_head) {
        sub_head = sub_head->next;
        list_num++;
    }
    //one node list won't work the following step
    if(list_num <= 1) return;

    //divide
    mid_head = *head;
    for(i = 0 ; i < list_num/2 ; i++) {
        sub_head = mid_head;
        mid_head = mid_head->next;
    }
    sub_head->next = NULL;

    sub_head = *head;
    merge_sort(&sub_head);
    merge_sort(&mid_head);
    //conquer
    *head = merge(sub_head,mid_head);
}
