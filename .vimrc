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
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" ステータスライン
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l(%L),%c%V%8P
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

"set noswapfile
"set directory=$HOME/.vim/temp


" 小文字で打った単語でも大文字で補完できるようにする。
set infercase


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


"-----------------------------
let g:gist_clip_command = 'xclip -selection clipboard'

let g:neocomplcache_enable_at_startup         = 1
let g:NeoComplCache_SmartCase                 = 1
let g:NeoComplCache_TagsAutoUpdate            = 1
let g:NeoComplCache_PreviousKeywordCompletion = 1
let g:NeoComplCache_MinSyntaxLength           = 3
let g:NeoComplCache_SkipInputTime             = '0.2'

" Align.vim
let g:Align_xstrlen=3 " 日本語など幅広文字に対応

" zencoding.vim
let g:user_zen_expandabbr_key = '<c-e>'

" pathogen.vim
call pathogen#runtime_append_all_bundles()

" fuzzyfinder.vim
let g:fuf_modesDisable   = [ 'buffer', 'mrufile', 'mrucmd' ]
let g:fuf_keyOpen        = '<CR>'
let g:fuf_keyOpenTabpage = '<C-j>'
let g:fuf_file_exclude   = '\v\~$|\.(o|exe|bak|swp|gif|jpg|png|mp3|ogg)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
nnoremap <silent> ff :FufFile **/<CR>
nnoremap <silent> fl :FufLine<CR>



"-----------------------------
nnoremap <silent> bd <Esc>:bw<CR>
nnoremap <silent> bn <Esc>:bn<CR>
nnoremap <silent> bp <Esc>:bp<CR>
nnoremap <silent> tc <Esc>:tabnew<CR>
nnoremap <silent> td <Esc>:tabclose<CR>
nnoremap <silent> tn <Esc>:tabnext<CR>
nnoremap <silent> tp <Esc>:tabprevious<CR>


"-----------------------------
setlocal omnifunc=syntaxcomplete#Complete

autocmd! BufRead,BufNewFile *.as set filetype=actionscript
autocmd FileType actionscript :set dictionary=$HOME/.vim/dict/actionscript.dict
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

" http://vim-users.jp/2009/10/hack91/
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'


" 全角スペースを強調
highlight ZenkakuSpace guibg=white ctermbg=7
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
function InsertTabWrapper()
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

