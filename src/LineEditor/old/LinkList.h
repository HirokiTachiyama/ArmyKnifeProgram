#pragma once

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "LE.h"

// ƒŠƒ“ƒNƒŠƒXƒg
typedef struct _LinkList {
	char* text;
	struct _LinkList* next;
	struct _LinkList* before;
} LinkList_t;


void insert_new_node(LinkList_t*, int, char*);
void delete_node(LinkList_t*, int);
LinkList_t* get_index_node(LinkList_t*, int);
void print_all_text(LinkList_t*);
void free_all_nodes(LinkList_t*);

