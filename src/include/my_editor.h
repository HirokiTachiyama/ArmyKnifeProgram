/**
 * @file MyEditor/my_editor.h
 * @author Copyright (C) 2017 by Hiroki Tachiyama
 * @date 2017/7/21(Fri) 18:14 JST
 */

/**
 * @brief 僕のエディタ 大元のヘッダ

  @detail 
 *
 */


#ifndef __MY_EDITOR__
#define __MY_EDITOR__

#include <iostream>
#include "buffer.h"

using namespace std;

/** @enum exit_status
    @brief 終了コード
    @detail 終了時のコード、0が通常終了 1が異常終了
 */
typedef enum _exit_status {
  EXIT_ZERO, EXIT_ONE
} exit_status;


#endif

