;;;; shogi-kifu-mode.el
; 将棋の棋譜ファイル(CSA形式) を再生するためのモード

; Emacs標準のdefine-generic-modeにて
; 言語モードの作成を行う
(require 'generic)

(define-generic-mode shogi-kifu-mode
  nil ; COMMENT-LIST
  nil ; KEYWORD-LIST

  ; FONT-LOCK-LIST 色分け対象を正規表現で指定して、faceを割当てる
  ; 「or」は、Emacsの正規表現だと 「\\| 」
  `(
    ; obj, 間接参照
    ; 2桁以上だとまだうまく色がつかない
    ("[1-9][0-9]\?[0-9]\? [0-9] R\\|[0-9] [0-9] obj\\|endobj" . font-lock-variable-name-face)

    ; 整数
    ("[0-9]" . font-lock-constant-face)           

    ; Keywords
    ( ,(mapconcat #'identity '(
			       "/Supplement"
			       "/Title"
			       "/Trapped"
			       "xref")
		  "\\|") . font-lock-keyword-face)

    ; names
    ( ,(mapconcat #'identity '(
			       "/Catalog"
			       "/XObject")
		  "\\|") . font-lock-type-face)
    ("stream\\|endstream" . font-lock-string-face))

  ; AUTO-MODE-LIST pdf-modeを有効にするファイルの正規表現
  '(".+.pdf")

  ; FUNCTION-LIST pdf-mode有効時に実行する関数名
  nil

  ; pdf-modeの説明
  "Major mode for kifu file; CSA-style")



