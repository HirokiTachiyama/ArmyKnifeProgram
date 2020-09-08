#include "LinkList.h"

void insert_new_node(LinkList_t* _top, int _index, char* _text) {
	LinkList_t* tmp = get_index_node(_top, _index);
	LinkList_t* new_node = (LinkList_t*)malloc(sizeof(LinkList_t));
	new_node->text = (char*)malloc( sizeof(char) * (strlen(_text) + 1) );

	// tmpの次に新しいノードを挿入する
	new_node->before  = tmp;
	new_node->next    = tmp->next;
	tmp->next->before = new_node;
	tmp->next         = new_node;
	strcpy_s(new_node->text, strlen(_text) + 1, _text);
}

void delete_node(LinkList_t* _top, int _index) {
	LinkList_t* tmp = get_index_node(_top, _index);

	tmp->next->before = tmp->before;
	tmp->before->next = tmp->next;

	free(tmp);
}

LinkList_t* get_index_node(LinkList_t* _top, int _index) {
	LinkList_t* tmp = _top;

	// 新しいノードを追加する位置まで進める
	for (int i = 0; i < _index; i++)
		tmp = tmp->next;
	
	return tmp;
}

// topとend以外のtextを表示、行番号付き
void print_all_text(LinkList_t* _top) {

	LinkList_t* node = _top->next;
	int index = 1;

	while (node->next != NULL) {
		printf("%d %s\n",index, node->text);
		node = node->next;
		index++;
	}
}


// LinkListをtopからendまで全てfreeする
void free_all_nodes(LinkList_t* _top) {
	LinkList_t* node = _top->next;

	// topのfree
	free(node->before);

	// top, end以外のノードのfree
	while (node->next != NULL) { //末尾のendに到達するまで
		node = node->next;
		free(node->before->text);
		free(node->before);
	}

	// endのfree
	free(node);
}
