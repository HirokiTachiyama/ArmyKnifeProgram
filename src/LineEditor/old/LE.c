// LE.cpp : このファイルには 'main' 関数が含まれています。プログラム実行の開始と終了がそこで行われます。

#include <stdio.h>
#include "LE.h"
#include "LinkList.h"


int main() {
	Buffer* buf = create_buffer();

	main_loop(buf);

	//do_workspace();

	free_buffer(buf);
	return 0;
}

// メインループ関数
// コマンドの読み込み及び各モードの実行
void main_loop(Buffer* _buf) {
	char* input_buf = (char*)malloc(sizeof(char) * MAX_LINE_SIZE);

	// q(quit) でループ終了
	while ( input_buf[0] != 'q'){
		printf("action? : ");
		fgets(input_buf, MAX_LINE_SIZE, stdin);
		input_buf[strlen(input_buf) - 1] = '\0'; //'\n'除去

		int len, number;
		if (strlen(input_buf) != 1) { // アルファベット1文字でない場合
			printf("input length is invalid.\n");
		} else {
			switch (input_buf[0]) {
			case 'a':
				set_current_mode(_buf, MODE_APPEND);
				print_status(_buf);
				printf("text?:");
				fgets(input_buf, MAX_LINE_SIZE, stdin);
				input_buf[strlen(input_buf) - 1] = '\0'; // chomp
				insert_new_node(_buf->top, _buf->current_index, input_buf);
				_buf->current_line_num++;
				_buf->current_index++;
				break;

			case 'e':
				set_current_mode(_buf, MODE_ERASE);
				print_status(_buf);
				system("cls");
				break;

			case 'r':
				set_current_mode(_buf, MODE_REPLACE);
				print_status(_buf);
				printf("Mode:Replace, Current line:%d\n", _buf->current_index);
				break;
			case 'c':
				set_current_mode(_buf, MODE_CHANGE_LINE);
				print_status(_buf);
				printf("Line number?[1-128]:");
				fgets(input_buf, MAX_LINE_SIZE, stdin);
				input_buf[strlen(input_buf) - 1] = '\0'; // chomp

				len = strlen(input_buf); 
				if (!(0 < len && len < 4)) { // 桁がおかしい
					printf("invalid length.\n");
					break;
				}

				number = atoi(input_buf);
				if (number > _buf->current_line_num) { // 存在しない行番号
					printf("not exist line.\n");
					break;
				}

				change_current_index(_buf, atoi(input_buf) - 1); // 内部では 0-127, 表示は 1-128
				break;
			case 'd':
				set_current_mode(_buf, MODE_DELETE_LINE);
				print_status(_buf);
//				scanf()
				break;

			case 'l':
				set_current_mode(_buf, MODE_LIST);
				print_status(_buf);
				print_all_text(_buf->top);
				break;
			case 'w':
				set_current_mode(_buf, MODE_WRITE);
				print_status(_buf);
				break;
			case 'h':
				set_current_mode(_buf, MODE_HELP);
				print_status(_buf);
				printf("Mode:Help\nAppend:a, List:l, Write:w, Replace:r, Change current index:c, Help:h, Quit:q.\n");
				break;
			case 'q':
				printf("bye.\n");
				break;
			default:
				printf("Invalid Command!\n");
			}

			set_current_mode(_buf, MODE_WAIT);

		}

	}


}


// プログラムの実行: Ctrl + F5 または [デバッグ] > [デバッグなしで開始] メニュー
// プログラムのデバッグ: F5 または [デバッグ] > [デバッグの開始] メニュー

// 作業を開始するためのヒント: 
//    1. ソリューション エクスプローラー ウィンドウを使用してファイルを追加/管理します 
//   2. チーム エクスプローラー ウィンドウを使用してソース管理に接続します
//   3. 出力ウィンドウを使用して、ビルド出力とその他のメッセージを表示します
//   4. エラー一覧ウィンドウを使用してエラーを表示します
//   5. [プロジェクト] > [新しい項目の追加] と移動して新しいコード ファイルを作成するか、[プロジェクト] > [既存の項目の追加] と移動して既存のコード ファイルをプロジェクトに追加します
//   6. 後ほどこのプロジェクトを再び開く場合、[ファイル] > [開く] > [プロジェクト] と移動して .sln ファイルを選択します
