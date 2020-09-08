#pragma once

#include "LE.h"
#include "LinkList.h"


typedef struct _LinkList LinkList_t;

// バッファ構造体
typedef struct {
	LinkList_t* top;
	int current_line_num; // 実際の総行数
	int current_index;    // 現在行
	char* file_name;
} Buffer;

Buffer* create_buffer();
void    free_buffer(Buffer*);

void change_current_index(Buffer*, int);
void print_status(Buffer*);
