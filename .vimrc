" vim: ts=4 sw=4 sts=4 et ff=unix fenc=utf-8
"------------------
" .vimrc


" viとの互換をとらない
set nocompatible


" 256色なおまじない。
set t_Co=256


" コマンドライン補完時に補完候補を表示する
set wildmenu
" ファイル名補完をzshっぽく (longest, list, full)
set wildmode=longest,list,full
" 編集中の内容を保ったまま画面を切り替えられるように
set hid
" Vimのヤンク・ペーストがクリップボードを使うように
set clipboard=unnamed,autoselect

" 自動折り返し
set wrap

" 新しいバッファの改行コード
set ffs=unix
" 改行コードの自動認識
set fileformats=unix,dos,mac
" UTF-8の○や□でカーソル位置がすれないよ
set ambiwidth=double

" UNDO回数
set undolevels=1000
" コマンド・検索パターンを履歴に残す数
set history=50
" 検索文字列が小文字の場合は大文字小文字を区別無く検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" インクリメンタル
set incsearch
" 検索結果の色付けを有効
set hlsearch


" 行番号を表示する
set number
" ルーラーを表示
set ruler
" 入力中のコマンドをステータスに表示する
set showcmd
set showmode
" 移動キーを押しても括弧の強調を有効にする
set cpoptions-=m
set matchtime=3
" 括弧入力時の対応する括弧を表示
set showmatch
" <>にもマッチするようにする
set matchpairs+=<:>

" ステータスラインを常に表示
set laststatus=2
" ステータスライン
" http://vim.g.hatena.ne.jp/eclipse-a/20080728/1217206885
" skk.vimのモードを'statusline'を変更していても表示する
function! StlFnc()
    return '[' . (&l:ft != '' ? &l:ft . ',' : '') . &l:ff[0] . ',' .  (&l:fenc != '' ? &l:fenc : &enc) . ']'
endfunction
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%{exists('*SkkGetModeStr')?SkkGetModeStr():''}%=%l(%L),%c%V%8P
" タブバーを常に表示
set showtabline=2
" タブの上限
set tabpagemax=30

" スクロールしても下の行を表示
set scrolloff=5

" タブや改行を表示する
set list
" 特殊文字の置き換え
set listchars=tab:>-,trail:_,eol:\ ,extends:>,precedes:<


" マウスモードを有効
set mouse=a
" 入力を開始したらマウスカーソルを隠す。
set mousehide

" backspaceキーの挙動を設定
set backspace=indent,eol,start

" 自動でインデントを揃える
set autoindent
set smartindent
" インデントの幅
set tabstop=4
" cindentやautoindentで挿入されるインデント幅
set shiftwidth=4
" Tab文字を空白に置き換えない
set noexpandtab
" カーソルを行頭・行末で止まらないように
set whichwrap=b,s,h,l,<,>

" バッファ切り替え時に自動に保存する
set autowrite
" ファイル終了時に自動保存する
set autowriteall
" 外部で変更されいた場合、自動で読み込む
set autoread

set nobackup
"set backupdir=$HOME/.vim/backup

set noswapfile
"set directory=$HOME/.vim/temp


" 小文字で打った単語でも大文字で補完できるようにする。
set infercase


"-----------------------------
let g:gist_clip_command = 'xclip -selection clipboard'

" vundle.vim
filetype off " temporary off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'ujihisa/neco-look'
Bundle 'ujihisa/neco-ruby'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-github'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/googletranslate-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tyru/skk.vim'
Bundle 'tyru/skkdict.vim'
Bundle 'YankRing.vim'
Bundle 'Align'
Bundle 'nginx.vim'
Bundle 'eregex.vim'
Bundle 'motemen/git-vim'

filetype plugin indent on " temporary on

"-----------------------------
" ハイライト
syntax on
colorscheme nitro

filetype on
filetype indent on
filetype plugin on

" 注意: この内容は:filetype onよりも後に記述すること。
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif


" git-vim.vim
let g:git_no_map_default = 1
nnoremap <Leader>gd :GitDiff<Enter>
nnoremap <Leader>gD :GitDiff --cached<Enter>
nnoremap <Leader>gs :GitStatus<Enter>
nnoremap <Leader>gl :GitLog<Enter>
nnoremap <Leader>gL :GitLog -u \| head -10000<Enter>
nnoremap <Leader>ga :GitAdd<Enter>
nnoremap <Leader>gA :GitAdd <cfile><Enter>
nnoremap <Leader>gc :GitCommit -v<Enter>
" 確認のため<Enter>の打鍵を要求
nnoremap <Leader>gp :GitPush

" skk.vim
let skk_large_jisyo = "/usr/share/skk/SKK-JISYO.L"
let skk_kutouten_type = "en"
let skk_kutouten_en = ".,"
let skk_show_annotation = 0
let skk_show_candidates_count = 1
let skk_use_face = 1
let skk_auto_save_jisyo = 1
" insert modeを抜けてもmodeを維持するか
let skk_keep_state=0
" non-zeroなら<CR>で確定した時に改行文字を出力しない
let skk_egg_like_newline = 1
let g:skk_use_color_cursor = 1 "gui only


" neocomplcache.vim
let g:neocomplcache_enable_at_startup          = 1
let g:neocomplcache_enable_ignore_case         = 1
let g:neocomplcache_enable_smart_case          = 1
let g:neocomplcache_enable_wildcard            = 1
let g:neocomplcache_enable_auto_delimiter      = 1
let g:neocomplcache_enable_auto_select         = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_keyword_length         = 3
let g:neocomplcache_min_syntax_length          = 3
let g:neocomplCache_TagsAutoUpdate             = 1
let g:neocomplCache_PreviousKeywordCompletion  = 1
let g:neocomplCache_SkipInputTime              = '0.2'
" 日本語をキャッシュしない
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby         = '[^. *\t]\.\h\w*\|\h\w*::'
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

" Unite.vim
nnoremap [unite] <Nop>
nmap f [unite]

nnoremap <silent> [unite]f :<C-U>Unite -buffer-name=files tab file file_rec file_mru<CR>
nnoremap <silent> [unite]b :<C-U>Unite -buffer-name=bookmark bookmark<CR>
nnoremap <silent> [unite]r :<C-U>Unite -buffer-name=register register<CR>
nnoremap  [unite]s  :<C-u>Unite source<CR>

let g:unite_enable_start_insert = 1
let g:unite_source_file_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|dat|sw[po]|gif|jpg|png|mp3|ogg\)$|(^|[/\\])\.(hg|git|bzr|svn)'
let g:unite_source_file_mru_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|dat|sw[po]|gif|jpg|png|mp3|ogg\)$|(^|[/\\])\.(hg|git|bzr|svn)'
let g:unite_source_file_rec_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]|mp3\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'
" let g:unite_source_file_mru_filename_format = '(%Y-%m-%d %H:%M:%S)'
" let g:unite_source_directory_mru_time_format = '(%Y-%m-%d %H:%M:%S)'
"let g:unite_enable_ignore_case = 1
"let g:unite_enable_smart_case = 1

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

call unite#custom_default_action('file,files', 'tabopen')
call unite#custom_default_action('ref', 'adove')
call unite#set_substitute_pattern('files', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#set_substitute_pattern('files', '^@', '\=getcwd()."/*"', 1)
call unite#set_substitute_pattern('files', '^\\', '~/*')

"" C-jでバッファに開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('open')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('open')


"-----------------------------
nnoremap <silent> bd <Esc>:bw<CR>
nnoremap <silent> bn <Esc>:bn<CR>
nnoremap <silent> bp <Esc>:bp<CR>
nnoremap <silent> te <Esc>:tabedit<CR>
nnoremap <silent> tc <Esc>:tabnew<CR>
nnoremap <silent> td <Esc>:tabclose<CR>
nnoremap <silent> tn <Esc>:tabnext<CR>
nnoremap <silent> tp <Esc>:tabprevious<CR>
"aaa バッファ毎にタブで開きなおす. ごちゃごちゃした時用
nnoremap <silent> ta :only<cr>:tabo<cr>:tab sball<cr>


"-----------------------------
setlocal omnifunc=syntaxcomplete#Complete

autocmd! BufRead,BufNewFile *.as set filetype=actionscript
autocmd! BufRead,BufNewFile /etc/nginx/*.conf set ft=nginx
autocmd! BufRead,BufNewFile /etc/nginx/conf.d/* set ft=nginx
autocmd! BufRead,BufNewFile /etc/nginx/sites-available/* set ft=nginx
autocmd FileType ruby set dictionary=$VIMRUNTIME/syntax/ruby.vim
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading    = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails             = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType yaml   set   expandtab ts=2 sw=2 ff=unix enc=utf-8 fenc=utf-8
autocmd FileType ruby   set noexpandtab ts=2 sw=2 ff=unix enc=utf-8 fenc=utf-8
autocmd FileType python set noexpandtab ts=2 sw=2 ff=unix enc=utf-8 fenc=utf-8
autocmd FileType php    set noexpandtab ts=2 sw=2 ff=unix enc=utf-8 fenc=utf-8

autocmd BufNewFile *.rb 0r $HOME/.vim/templates/skeleton.ruby
autocmd BufNewFile *.py 0r $HOME/.vim/templates/skeleton.py


"-----------------------------
" <Esc>連打で検索結果の色付けを解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 検索語が中心に来るように
" ([zz]はカレント行を画面中央にする)
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" 折り返し行で見た目上での前後の行へ移動する
nnoremap j gj
nnoremap k gk
nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>

" <C-d>: delete char.
inoremap <C-d> <Del>

" http://vim-users.jp/2009/10/hack91/
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'


" 全角スペースを強調
highlight ZenkakuSpace guibg=white ctermbg=191
match ZenkakuSpace /　/


" 文字コードの自動認識
" http://www.kawaz.jp/pukiwiki/?vim#cb691f26
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うように
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" Omni補完を<Tab>で
function! InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" 場所毎の設定ファイル読み込み
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

function! ReloadFirefox()
    if has('ruby')
:ruby << EOF
    require "net/telnet"
    telnet = Net::Telnet.new({
        "Host" => "192.168.1.17",
        "Port" => 4242
        })
        telnet.puts("content.location.reload(true)\n")
        telnet.close
EOF
    endif
endfunction
command! ReloadFirefox :call ReloadFirefox()
command! FirefoxStartObserve autocmd BufWritePost <buffer> :ReloadFirefox
command! FirefoxStopObserve autocmd! BufWritePost <buffer>

function! Whatthecommit()
    0r!curl -s http://whatthecommit.com/index.txt
endfunction
command! Whatthecommit :call Whatthecommit()

" grep
command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
    let target = len(a:args) > 1 ? join(a:args[1:]) : '**/*'
    execute 'vimgrep' '/' . a:args[0] . '/j ' . target
    if len(getqflist()) != 0 | copen | endif
endfunction

