/**
 * @file MyEditor/buffer.cpp
 * @author Copyright (C) 2017 by Hiroki Tachiyama
 * @date 2017/7/21(Fri) 18:28 JST
 */

/**
 * @brief バッファ本体

  @detail 
 *
 */

#include "buffer.h"


buffer::buffer (string _buf_name) {
  buf_name = _buf_name;
  cursor_x=0; cursor_y=0;
  //str_vect.push_back("");
}



void buffer::add_line (string str) {
  str_vect.push_back(str);
}

string buffer::get_line_index_of (int index) {
  return str_vect[index];
}

void buffer::display_str_vect () {

  //autoで型推論を行ってくれる
  //今は、str_vectのvector<string>型とイテレーションを利用することから、
  //std::vector<string>::iterator型となってるはず
  //  auto itr = str_vect.begin();
  for(vector<string>::iterator itr; itr != str_vect.end(); ++itr) {
    cout << *itr << endl; //*itrで要素の内容を指す
  }

}


