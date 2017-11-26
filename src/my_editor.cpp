/**
 * @file MyEditor/buffer.h
 * @author Copyright (C) 2017 by Hiroki Tachiyama
 * @date 2017/7/21(Fri) 18:20 JST
 */

/**
 * @brief 僕のエディタ main
 *
 * @detail
 *
 */


#include "my_editor.h"

using namespace std;

int main (void) {

  buffer buf("buffer");
  cout << "Hello C++!" << endl;

  buf.add_line("hoge");
  cout << buf.get_line_index_of(0);
  buf.add_line("fuga");
  buf.add_line("tohoho");
  buf.add_line("nyoho");
  cout << buf.get_line_index_of(1);
  cout << buf.get_line_index_of(2);
  cout << buf.get_line_index_of(3) << endl;


  return 0;
}



