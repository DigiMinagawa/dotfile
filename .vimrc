"#######################
" 基本設定系
"#######################
nnoremap <TAB> <C-w>
nnoremap $ >
nnoremap ^ <
nnoremap > $
nnoremap < ^
"F2でpasteモードに。pasteするときにインデントを無効化。
" <F2> to paste mode.
set pastetoggle=<F2>

"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
set nocompatible
set tabstop=4
set shiftwidth=4
set hlsearch
set backspace=indent,eol,start

"#######################
" プログラミングヘルプ系
"#######################
syntax on "カラー表示
set smartindent "オートインデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=4 sw=4 sts=0 "タブは半角4文字分のスペース
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif


"#######################
" Vim 補完
"#######################
inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap { {}<ESC>i
inoremap <expr> } ClosePair('}')
inoremap [ []<ESC>i
inoremap <expr> ] ClosePair(']')

"#######################
"Python
"#######################
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4


"#######################
" 検索系
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set hlsearch "検索文字をハイライト


"#######################
" ハイライトをうまく
"#######################
" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"#######################
"Color
"#######################
set t_Co=256
colorscheme molokai

"########################
"Bundle Install
"########################
set rtp+=~/.vim/vundle/    " (2)
call vundle#rc()               " (3)

Bundle 'xml.vim'

"########################
"neocomplcache
"########################
Bundle 'Shougo/neocomplcache'
Bundle 'https://github.com/Shougo/neocomplcache-snippets-complete'
"補完ウィンドウの設定 :help completeopt
set completeopt=menuone
"neocomp有効化
let g:neocomplcache_enable_at_startup = 1 
"区切り文字補完有効化
let g:neocomplcache_enable_underbar_completion = 1 
"現在選択している候補を確定
inoremap <expr><C-y> neocomplcache#close_popup()
"現在選択している候補をキャンセル
inoremap <expr><C-e> neocomplcache#cancel_popup()
" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
"TABでNextKeyWordに行く
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"前回行われた補完をUndo
inoremap <expr><C-g>     neocomplcache#undo_completion()
"共通部分を補完
inoremap <expr><C-l> neocomplcache#complete_common_string()
"snipetの置き場
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
" <C-k> にマッピング
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
command! -nargs=* Nes NeoComplCacheEditSnippets


"########################
"unite
"########################
Bundle 'Shougo/unite.vim'

" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.

    nmap <buffer> <ESC>      <Plug>(unite_exit)
    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    " <C-l>: manual neocomplcache completion.
    inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>

    " Start insert.
    "let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

" For unite-session.
" Save session automatically.
"let g:unite_source_session_enable_auto_save = 1
" Load session automatically.
"autocmd VimEnter * UniteSessionLoad

" For ack.
if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
endif 
"########################
"quickrun
"########################
Bundle 'quickrun'
augroup QuickRunPHPUnit
    autocmd!
    autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
    autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.unit
augroup END

" 初期化
let g:quickrun_config = {}
" PHPUnit
let g:quickrun_config['php.unit'] = {'command': 'phpunit'}

Bundle 'molokai'
Bundle 'colorizer'
