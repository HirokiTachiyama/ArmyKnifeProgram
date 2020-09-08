#pragma once

#define MAX_LINE_SIZE 128 // 一行の最大文字数

#define MODE_WAIT        0 // コマンド入力待ち
#define MODE_APPEND      1 // 行入力
#define MODE_REPLACE     2 // 行置き換え
#define MODE_LIST        3 // 全行表示
#define MODE_WRITE       4 // ファイル保存
#define MODE_CHANGE_LINE 5 // 現在行変更
#define MODE_DELETE_LINE 6 // 行削除
#define MODE_HELP        7 // ヘルプ
#define MODE_ERASE       8 // 画面クリア

#include "Buffer.h"

void main_loop(Buffer*);
