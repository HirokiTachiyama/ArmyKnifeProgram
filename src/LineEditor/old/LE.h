#pragma once

#define MAX_LINE_SIZE 128 // ��s�̍ő啶����

#define MODE_WAIT        0 // �R�}���h���͑҂�
#define MODE_APPEND      1 // �s����
#define MODE_REPLACE     2 // �s�u������
#define MODE_LIST        3 // �S�s�\��
#define MODE_WRITE       4 // �t�@�C���ۑ�
#define MODE_CHANGE_LINE 5 // ���ݍs�ύX
#define MODE_DELETE_LINE 6 // �s�폜
#define MODE_HELP        7 // �w���v
#define MODE_ERASE       8 // ��ʃN���A

#include "Buffer.h"

void main_loop(Buffer*);
