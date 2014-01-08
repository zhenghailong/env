set t_Co=256
"set mouse=a
set ttymouse=xterm2

set guifont=Ricty:h10:cUTF8
" vim ���ȼ���ĥ��ǽ��Ȥ�(vi�Ȥθߴ�����Ȥ�ʤ�)

"set nocompatible

" ʸ�������ɤ���ꤹ��

set encoding=utf-8

" �ե����륨�󥳡��ɤ���ꤹ��
" /etc/vimrc����Ѥ�
set fileencodings=utf-8,euc-jp

" ��ưǧ����������ԥ����ɤ���ꤹ��

set fileformats=unix,dos

" �Хå����åפ�Ȥ�

" �դ� [ set nobackup ]

set backup

" �Хå����åפ���ǥ��쥯�ȥ����ꤹ��

set backupdir=~/backup

" ���������50�ĻĤ�

set history=50

" ����������ʸ����ʸ������̤��ʤ�

"set ignorecase

" ���������ʸ���򺮤���ȸ���������ʸ������̤���

set smartcase

" ������˥ޥå�����ñ���ϥ��饤�Ȥ���

" �դ� [ set nohlsearch ]

set hlsearch

" ���󥯥��󥿥륵������Ȥ� ( �����������Ƥ������椫�����ޥå�����ʸ����θ����򳫻�)

" �դ� [ set noincsearch ]

set incsearch

" ���ֹ��ɽ������

" �դ� [ set nonumber ]

set number

" ���� ( $ ) �䥿�� ( ^I ) ��Ļ벽����

"set list

" ������ϻ����б������̤�Ĵ����

set showmatch

" ��ʸ���Ȥ˿�ʬ��ɽ������

" �դ� [ syntax off ]

syntax on

" [ syntax on ] �ξ��Υ�����ʸ�ο����ѹ�����

highlight Comment ctermfg=LightCyan

" ��
"colorschem darkblue
"colorschem zenburn 
colorschem desert 

" ������ɥ����ǹԤ��ޤ��֤�

" �դ� [ set nowrap ]

set wrap

"tab����
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

" ���󥵡��ȥ⡼��ȴ���������ܸ�⡼��OFF
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" insert�⡼�ɤ���ȴ����
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" ��Ƭ��������ư�����򥭡������а��֤ˤ��碌��
nnoremap 0 $ 
nnoremap 1 0 

" �����⡼�ɤǤΥ��������ư
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

" ������������ʸ�����
inoremap <silent> <C-h> <C-g>u<C-h>
" ����������ʸ�����
inoremap <silent> <C-d> <Del>
" �������뤫���Ƭ�ޤǺ��
inoremap <silent> <C-d>e <Esc>lc^
" �������뤫������ޤǺ��
inoremap <silent> <C-d>0 <Esc>lc$
" �������뤫���Ƭ�ޤǥ��
inoremap <silent> <C-y>e <Esc>ly0<Insert>
" �������뤫������ޤǥ��
inoremap <silent> <C-y>0 <Esc>ly$<Insert>

" ������, ��̤�����
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap <> <><Left>

map <C-N>   :bnext<CR>
map <C-P>   :bprevious<CR>

"perl����
""map ,ptv <Esc>:'<,'>! perltidy<CR>
""map ,pt <Esc>:! perltidy<CR>

"php����
map ,ptv <Esc>:'<,'>! phpStylist<CR>
map ,pt <Esc>:PhpStylist<CR>

"php�ݴ�
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

call pathogen#runtime_append_all_bundles()

"���ϥ⡼�ɻ������ơ������饤��Υ��顼���ѹ�
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"���ѥ��ڡ������в�
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /��/

""" Unite.vim
" ��ư���˥��󥵡��ȥ⡼�ɤǳ���
let g:unite_enable_start_insert = 0

" ���󥵡��ȡ��Ρ��ޥ�ɤ��餫��Ǥ�ƤӽФ���褦�˥����ޥå�
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" �Хåե�����
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �ե��������
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" �쥸��������
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" �Ƕ���Ѥ����ե��������
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" �����褻
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim��ǤΥ����ޥåԥ�
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " ñ��ñ�̤���ѥ�ñ�̤Ǻ������褦���ѹ�
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESC������2�󲡤��Ƚ�λ����
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

autocmd QuickFixCmdPost *grep* cwindow
