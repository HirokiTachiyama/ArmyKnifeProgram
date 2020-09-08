#pragma once

#include "LE.h"
#include "LinkList.h"


typedef struct _LinkList LinkList_t;

// �o�b�t�@�\����
typedef struct {
	LinkList_t* top;
	int current_line_num; // ���ۂ̑��s��
	int current_index;    // ���ݍs
	char* file_name;
} Buffer;

Buffer* create_buffer();
void    free_buffer(Buffer*);

void change_current_index(Buffer*, int);
void print_status(Buffer*);
