set t_Co=256
"set mouse=a
set ttymouse=xterm2

set guifont=Ricty:h10:cUTF8
" vim の独自拡張機能を使う(viとの互換性をとらない)

"set nocompatible

" 文字コードを指定する

set encoding=utf-8

" ファイルエンコードを指定する
" /etc/vimrc定義済み
set fileencodings=utf-8,euc-jp

" 自動認識させる改行コードを指定する

set fileformats=unix,dos

" バックアップをとる

" 逆は [ set nobackup ]

set backup

" バックアップを作るディレクトリを指定する

set backupdir=~/backup

" 検索履歴を50個残す

set history=50

" 検索時に大文字小文字を区別しない

"set ignorecase

" 検索語に大文字を混ぜると検索時に大文字を区別する

set smartcase

" 検索語にマッチした単語をハイライトする

" 逆は [ set nohlsearch ]

set hlsearch

" インクリメンタルサーチを使う ( 検索語を入れている途中から随時マッチする文字列の検索を開始)

" 逆は [ set noincsearch ]

set incsearch

" 行番号を表示する

" 逆は [ set nonumber ]

set number

" 改行 ( $ ) やタブ ( ^I ) を可視化する

"set list

" 括弧入力時に対応する括弧を強調する

set showmatch

" 構文ごとに色分け表示する

" 逆は [ syntax off ]

syntax on

" [ syntax on ] の場合のコメント文の色を変更する

highlight Comment ctermfg=LightCyan

" 色
"colorschem darkblue
"colorschem zenburn 
colorschem desert 

" ウィンドウ幅で行を折り返す

" 逆は [ set nowrap ]

set wrap

"tab設定
set expandtab
set tabstop=4
set shiftwidth=4

" StatusLine
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" indet guides
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" MAP
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" インサートモード抜けたら日本語モードOFF
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $ 
nnoremap 1 0 

" 挿入モードでのカーソル移動
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

" カーソル前の文字削除
inoremap <silent> <C-h> <C-g>u<C-h>
" カーソル後の文字削除
inoremap <silent> <C-d> <Del>
" カーソルから行頭まで削除
inoremap <silent> <C-d>e <Esc>lc^
" カーソルから行末まで削除
inoremap <silent> <C-d>0 <Esc>lc$
" カーソルから行頭までヤンク
inoremap <silent> <C-y>e <Esc>ly0<Insert>
" カーソルから行末までヤンク
inoremap <silent> <C-y>0 <Esc>ly$<Insert>

" 引用符, 括弧の設定
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <> <><Left>

map <C-N>   :bnext<CR>
map <C-P>   :bprevious<CR>

"perl整形
""map ,ptv <Esc>:'<,'>! perltidy<CR>
""map ,pt <Esc>:! perltidy<CR>

"php整形
map ,ptv <Esc>:'<,'>! phpStylist<CR>
map ,pt <Esc>:PhpStylist<CR>

"php保管
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

call pathogen#runtime_append_all_bundles()

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

""" Unite.vim
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 0

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

autocmd QuickFixCmdPost *grep* cwindow
