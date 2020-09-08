#include <string.h>
#include "le.h"
#include "buffer.h"
#include "LinkList.h"

Buffer* create_buffer() {
	Buffer* buf = (Buffer*)malloc(sizeof(Buffer));

	buf->top = NULL;
	buf->top->next = NULL;

	buf->top = (LinkList_t*)malloc(sizeof(LinkList_t));
	buf->top->next = (LinkList_t*)malloc(sizeof(LinkList_t));

	LinkList_t* top = buf->top;
	LinkList_t* end = buf->top->next;

	top->before = NULL;
	end->next = NULL;

	buf->current_line_num = 0;
	buf->current_index = 0;

	return buf;
}

void change_current_index(Buffer* _buf, int _next_index) {
	_buf->current_index = _next_index;
}

void free_buffer(Buffer* _buf) {
	free_all_nodes(_buf->top);
	free(_buf);
}

