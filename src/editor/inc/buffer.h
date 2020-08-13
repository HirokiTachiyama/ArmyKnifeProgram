/**
 * @file MyEditor/buffer.h
 * @author Copyright (C) 2017 by Hiroki Tachiyama
 * @date 2017/7/21(Fri) 16:58 JST
 */

/**
 * @brief バッファの情報を保持するクラス

  @detail
  テキスト保持にはLine構造体をリストで繋いだやつ。
  他には、バッファ名、マウスカーソルの位置などを保持。
 *
 */

#ifndef __BUFFER_H__
#define __BUFFER_H__

#include <iostream>
#include <string>
#include <vector>
#include <curses.h>

using namespace std;

class buffer {
 public:
  vector<string> str_vect; //テキスト
  string buf_name; //バッファの名前

  //! @var
  int cursor_x, cursor_y; //カーソル位置

  //member methods
  buffer (string);
  void add_line (string);
  string get_line_index_of (int);
  void display_str_vect ();
};

#endif
