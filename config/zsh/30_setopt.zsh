## Expansion and Globbing
# グロブを展開するときにディレクトリに/を付ける
setopt MARK_DIRS

## History
# ヒストリファイルへ追記する
setopt APPEND_HISTORY
# ヒストリリスト内で重複させない
setopt HIST_IGNORE_ALL_DUPS
# ヒストリ保存時に余分な空白を除去する
setopt HIST_REDUCE_BLANKS

## Input/Output
# コマンドのスペルミスを修正する
setopt CORRECT
# C-sによるフロー制御を無効にする
setopt NO_FLOW_CONTROL
# C-d(EOF)でシェルを終了しない
setopt IGNORE_EOF
# 対話シェルでも#以降をコメントとみなす
setopt INTERACTIVE_COMMENTS
# コマンドが0以外で終了したときに値を表示する
setopt PRINT_EXIT_VALUE
# 左辺=右辺の形式になっている引数でファイル名展開を行う
setopt MAGIC_EQUAL_SUBST
# 数字の付いたファイル名を文字順ではなく数値順に並べる
setopt NUMERIC_GLOB_SORT

## Job Control
# シェルを終了するときに実行中ジョブにHUPを送らない
setopt NO_HUP

## Prompting
# PROMPT変数の中で変数展開する
setopt PROMPT_SUBST
# コマンド実行時に右プロンプトを消去する
setopt TRANSIENT_RPROMPT

## Zle
# ビープを抑止
setopt NO_BEEP
