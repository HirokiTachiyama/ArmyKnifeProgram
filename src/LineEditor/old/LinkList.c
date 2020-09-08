#include "LinkList.h"

void insert_new_node(LinkList_t* _top, int _index, char* _text) {
	LinkList_t* tmp = get_index_node(_top, _index);
	LinkList_t* new_node = (LinkList_t*)malloc(sizeof(LinkList_t));
	new_node->text = (char*)malloc( sizeof(char) * (strlen(_text) + 1) );

	// tmp�̎��ɐV�����m�[�h��}������
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

	// �V�����m�[�h��ǉ�����ʒu�܂Ői�߂�
	for (int i = 0; i < _index; i++)
		tmp = tmp->next;
	
	return tmp;
}

// top��end�ȊO��text��\���A�s�ԍ��t��
void print_all_text(LinkList_t* _top) {

	LinkList_t* node = _top->next;
	int index = 1;

	while (node->next != NULL) {
		printf("%d %s\n",index, node->text);
		node = node->next;
		index++;
	}
}


// LinkList��top����end�܂őS��free����
void free_all_nodes(LinkList_t* _top) {
	LinkList_t* node = _top->next;

	// top��free
	free(node->before);

	// top, end�ȊO�̃m�[�h��free
	while (node->next != NULL) { //������end�ɓ��B����܂�
		node = node->next;
		free(node->before->text);
		free(node->before);
	}

	// end��free
	free(node);
}
