"===================================================================
" Vundle
"===================================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'atelierbram/vim-colors_duotones'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cohama/the-ocamlspot.vim'
Plugin 'gmarik/vundle'
Plugin 'gregsexton/gitv'
Plugin 'ebc-2in2crc/vim-ref-jvmis'
Plugin 'kana/vim-operator-replace'
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-smartinput'
Plugin 'kana/vim-textobj-fold'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-lastpat'
Plugin 'kana/vim-textobj-user'
Plugin 'LeafCage/yankround.vim'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/eregex.vim'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler'
Plugin 'Shougo/vimproc'
Plugin 'Source-Explorer-srcexpl.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-ref'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tyru/vim-altercmd'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/IndentAnything'
Plugin 'vim-scripts/vimwiki'

call vundle#end()
filetype plugin indent on

" デフォルトのバックスラッシュを使う
let mapleader = ""

"===================================================================
" folding
"===================================================================
" folds defined by markers in the text
set foldmethod=marker

"===================================================================
" edit, view
"===================================================================
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set number
set noruler
set hlsearch
set showcmd
set nobackup

" command history
set history=1000

" 行頭空白、改行、挿入モードの開始位置での削除を出来るようにする
set backspace=indent,eol,start

" redo
nnoremap U <C-r>

"===================================================================
" search
"===================================================================
set nowrapscan

" 大文字小文字を区別しない
set ignorecase
" 検索文字列に大文字が含まれている場合は大小文字を区別
set smartcase
" インクリメンタルサーチ
set incsearch
" 検索文字を強調表示
set hlsearch
" 対応する括弧へのジャンプ無効
set noshowmatch

set noundofile

nnoremap / /\v
nnoremap ? ?\v

" Current line at center of window and open the folding.
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" Physical moving.
nnoremap j gj
nnoremap k gk
noremap gj j
noremap gk k

" keymap, tab-page
set tabpagemax=20
nnoremap <silent> <C-j> :<C-u>tabnext<CR>
nnoremap <silent> <C-k> :<C-u>tabprevious<CR>
"map <D-[> <Esc>:tabnext<CR>
"map <D-]> <Esc>:tabprevious<CR>
"map <D-j> <Esc>:tabnext<CR>
"map <D-k> <Esc>:tabprevious<CR>
"nnoremap <Tab> :tabnext<CR>
"nnoremap <S-Tab> :tabprevious<CR>

" 検索結果の強調表示をやめる
nnoremap <silent> <Esc> :<C-u>nohlsearch<CR>

" clipboard
set clipboard=unnamed

" ファイルパスの置き換え
inoremap <expr> <C-r>p% expand('%:p')
inoremap <expr> <C-r>h% expand('%:p:h')

" ヘルプを三倍の速さで引く
nnoremap <C-h> :<C-u>help<Space>
" カーソル下のキーワードでヘルプを引く
nnoremap <Space>K :<C-u>help<Space><C-r><C-w><CR>

" Yank to the end of line. (It is same as C and D)
nnoremap Y y$

" カーソル行をハイライト
set cursorline

" ヘルプを書くときだけ使う
"colorcolumn=80

" インサートモードの時はカーソル形状を変える
" ※iTerm のようにカーソル形状を変えられるときだけ
" (GVim だと勝手に変わってくれるのでターミナルの時だけ設定する)
if !has('gui_running')
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" IME
if has('gui_running')
  " IME 自動制御を有効にする
  set noimdisable
  " インサートモードを抜けるときに IME をオフにする。
  " インサートモードに入るときの IME 制御は特にしない
  set imdisableactivate
endif

" turn off the alert
set noerrorbells
set novisualbell
set visualbell t_vb=

" MacBook Battery http://d.hatena.ne.jp/lurker/20060801/1154443551
command! Battery echo split(system("pmset -g ps | egrep -o '[0-9]+%'"), "\n")[0]

" Say supports
command! Say silent execute '!say "' . escape(getline('.'), '"') . '" &>/dev/null &'

"===================================================================
" statusline
"===================================================================
set laststatus=2
set statusline=%<%f\ %9(%m%r%h%)%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}%y
set statusline+=%=%l/%L,%c%V%8P

"===================================================================
" open vimrc
"
" @bleis さんの「Vim 再入門」からコピペ
" http://www.slideshare.net/bleistift/vim-8362118
"===================================================================
let vimrcbody = '$HOME/.vimrc'
"let gvimrcbody = '$HOME/.gvimrc'

function! OpenFile(file)
  let empty_buffer = line('$') == 1 && strlen(getline('1')) == 0
  if empty_buffer && !&modified
    execute 'e ' . a:file
  else
    execute 'tabnew ' . a:file
  endif
endfunction

command! OpenMyVimrc call OpenFile(vimrcbody)
"command! OpenMyGVimrc call OpenFile(gvimrcbody)
nnoremap <Space><Space> :<C-u>OpenMyVimrc<CR>
"nnoremap <Space><Tab> :<C-u>OpenMyGVimrc<CR>

"===================================================================
" reloadable vimrc
"
" @bleis さんの「Vim 再入門」からコピペ
" http://www.slideshare.net/bleistift/vim-8362118
"===================================================================
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    execute 'source ' . a:file
  endif
  echo 'Reloaded ' . a:file
endfunction

" ターミナルだと $MYVIMRC が空なのはなぜだろう…
nnoremap <F5> :<C-u>execute ":source " vimrcbody<CR>
\ :call SourceIfExists('~/.vim/ftplugin/' . &filetype . '.vim')<CR>

"\ :<C-u>execute ":source " gvimrcbody<CR>
"===================================================================
" デフォルトの文字コード
"===================================================================
set encoding=utf-8
scriptencoding utf-8

"===================================================================
" color setting
"===================================================================
syntax enable
set background=dark

if filereadable(expand("~/.vim_colorscheme.vim"))
  source ~/.vim_colorscheme.vim
else
  if has('gui_running')
    colorscheme solarized
  else
    let g:solarized_contrast = "high"
    colorscheme solarized
  endif
endif

"===================================================================
" font setting
"===================================================================
" Kaoriya さんの vimrc からコピペ + フォントだけ変更
if has('win32')
  " Windows用
  set guifont=MS_Gothic:h12:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('gui_macvim')
"  set guifont=Osaka-Mono:h14
  set guifont=Myrica\ Monospace:h18
elseif has('mac')
  set guifont=Myrica\ Monospace:h18
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"===================================================================
" gitv
"===================================================================
augroup git
  autocmd!
  autocmd FileType git :setlocal foldlevel=99
augroup END

"===================================================================
" window setting
"===================================================================
if has('gui_running')
  " ウィンドウの幅
  set columns=100
  " ウインドウの高さ
  set lines=40
  " ツールバー無し
  set guioptions-=T
endif

"===================================================================
" vim-operator-replace
"===================================================================
map R <Plug>(operator-replace)

"===================================================================
" vim-smartinput
"===================================================================
call smartinput#map_to_trigger('i', '*', '*', '*')
call smartinput#define_rule({
            \   'at'       : '(\%#',
            \   'char'     : '*',
            \   'input'    : '*  *<Left><Left>',
            \   'filetype' : ['ocaml'],
            \   })

"===================================================================
" yankround.vim
"===================================================================
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

let g:yankround_max_history = 50

"===================================================================
" unite
"===================================================================
" 入力モードで開始する
"let g:unite_enable_start_insert=1

" ゆろよろさんのコピペ
" http://yuroyoro.hatenablog.com/entry/20120211/1328930819
"
" memo: ほとんど 'Unite file_mru' しか使ってない

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 最近使用したディレクトリ一覧
nnoremap <silent> ,ud :<C-u>Unite directory_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"===================================================================
" neocomplete
"===================================================================
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"imap <expr><C-k> neocomplete#sources#snippets_complete#expandable() ? "\<Plug>(neocomplete_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

inoremap <silent><CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" 補完をキャンセル
inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup() . "\<C-h>"

" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"===================================================================
" vimfiler
"===================================================================
" アンセーフモード
let g:vimfiler_safe_mode_by_default = 0
" vimfiler 起動
nnoremap <Space>f :<C-u>VimFiler<CR>

"===================================================================
" eregex.vim
"===================================================================
let g:eregex_forward_delim = ',/'
let g:eregex_backward_delim = ',?'

nnoremap g:eregex_forward_delim :M/
nnoremap g:eregex_backward_delim :M?

"===================================================================
" matchit
"===================================================================
source $VIMRUNTIME/macros/matchit.vim

"===================================================================
" ファイルオープン時、最後の編集位置にカーソルを移動させる
"===================================================================
autocmd! BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"===================================================================
" quickfix
"===================================================================
augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost helpgrep,vimgrep copen
augroup END

"===================================================================
" vimwiki
"===================================================================
" ファイル保存時に編集中の wiki ファイルを HTML に変換する
autocmd BufWritePost *.wiki silent Vimwiki2HTML

"===================================================================
" Source Explorer
"===================================================================
" 自動でプレビュー表示
let g:SrcExpl_refreshTime = 100
" プレビューウィンドウの高さ
let g:SrcExpl_winHeight = 9
" tags ファイルを自動で生成する
let g:SrcExpl_isUpdateTags = 1
" 定義への移動、戻るキー
let g:SrcExpl_jumpKey = '<CR>'
let g:SrcExpl_gobackKey = '<BS>'

"===================================================================
" ref.vim
"===================================================================
function! RefWiki()
  let keyword = expand("<cword>")
  execute "Ref webdict wikipedia:ja " . keyword
endfunction

let g:ref_source_webdict_sites = {
\   'wikipedia:ja': {
\     'url': 'http://ja.wikipedia.org/wiki/%s'
\   },
\ }
let g:ref_source_webdict_sites.default = 'wikipedia:ja'

if !exists('g:ref_detect_filetype')
  let g:ref_detect_filetype = {}
endif
let g:ref_detect_filetype['_'] = 'webdict'

command! Wiki call RefWiki()
nnoremap <silent> <Space>wiki :<C-u>Wiki<CR>

" jquery
nnoremap <Space>jq :<C-u>Ref jquery<Space>
let g:ref_jquery_path = expand("~/.vim/bundle/vim-ref-jquery/jqapi-docs/")

"===================================================================
" quickrun
"===================================================================
let g:quickrun_config = {
\ 'groovy': {'command' : 'groovyclient'},
\ 'java': {
\   'command' : 'java',
\   'exec': ['javac %s', '%c %o %s:t:r %a'],
\   'cmdopt' : '-ea:...'
\ },
\ '_': {'outputter/buffer/into' : 1,},
\ }

"===================================================================
" command-line window
"
" Hack #161: Command-line windowを使いこなす
" http://vim-users.jp/2010/07/hack161/
"===================================================================
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
nnoremap q: q:<Esc>k

function! s:enter_cmdwin()
  call altercmd#define('b', 'gr[ep]', 'Grep', 'i')
  " 下記の書き方でも良い
  " AlterCommand <buffer><mode:i> gr[ep] Grep

  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <Tab> :<C-u>quit<CR>

  inoremap <buffer><expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
  inoremap <buffer><expr><BS> neocomplete#smart_close_popup() . "\<C-h>"
  inoremap <buffer> <C-c> <Esc>

  " Completion
  inoremap <buffer><expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

  " 自動補完されると q みたいな短いコマンドが打ちにくいので
  " neocomplete の動作する文字列長を調整

  " Source Explorer がウザいので動かないようにする
  "let s:update_time = &updatetime
  if !exists(g:SrcExpl_refreshTime)
    let s:update_time = g:SrcExpl_refreshTime
  else
    let s:update_time = &updatetime
  endif
  set updatetime=100000

  startinsert!
endfunction

function! s:leave_cmdwin()
  " Source Explorer を再動作させる
  exe "set updatetime=" . string(s:update_time)
endfunction

augroup MyAutoCmd
  autocmd!
  autocmd CmdwinEnter * call s:enter_cmdwin()
  autocmd CmdwinLeave * call s:leave_cmdwin()
  autocmd BufEnter * call s:enter_buffer()
  autocmd BufLeave * call s:Leave_buffer()
augroup END

function! s:enter_buffer()
  call s:diff_mode()

  if &filetype=="python"
    IndentGuidesEnable
  endif
endfunction

function! s:Leave_buffer()
  if &filetype=="python"
    IndentGuidesDisable
  endif
endfunction

function! s:diff_mode()
  if !&diff
    return
  endif

  nnoremap <buffer> qq :qa!<CR>
  nnoremap <buffer> J ]c
  nnoremap <buffer> K [c
  nnoremap <buffer> H <C-w>h
  nnoremap <buffer> L <C-w>l

  if has('gui')
    setlocal columns=156
    wincmd =
  endif
endfunction

"===================================================================
" ftplugin setting {{{1
"===================================================================

"===================================================================
" for html setting {{{2
"===================================================================
function! s:MyFtpluginHtml()
"  if exists("b:did_ftplugin_html")
"    finish
"  endif
"  let b:did_ftplugin_html = 1

  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
endfunction

autocmd FileType html call s:MyFtpluginHtml()

"===================================================================
" for Groovy setting {{{2
"===================================================================
function! s:MyFtpluginGroovy()

  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
endfunction

autocmd FileType groovy call s:MyFtpluginGroovy()
autocmd BufRead,BufNewFile *.gradle set filetype=groovy

"===================================================================
" for JavaScript setting {{{2
"===================================================================
function! s:MyFtpluginJavaScript()
"  if exists("b:did_ftplugin_javascript")
"    finish
"  endif
"  let b:did_ftplugin_javascript = 1

  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2

endfunction

autocmd FileType javascript call s:MyFtpluginJavaScript()

"===================================================================
" for OCaml setting {{{2
"===================================================================
function! s:MyFtpluginOcaml()

  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2

  augroup ocamlopen
    autocmd!
  augroup END
endfunction

autocmd FileType ocaml call s:MyFtpluginOcaml()

"===================================================================
"
" for Python setting {{{2
"===================================================================
function! s:MyFtpluginPython()
"  if exists("b:did_ftplugin_python")
"    finish
"  endif
"  let b:did_ftplugin_python = 1

  setlocal expandtab
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4

  "===================================================================
  " vim-indent-guides
  "===================================================================
  " indent-guides を有効にする
  IndentGuidesEnable

  "===================================================================
  " todo: GVim を導入したので自動カラーにしたいかもしれない
  "===================================================================
  " 1インデント目からガイドする
  let g:indent_guides_start_level = 1
  " 自動カラーを無効にして手動で設定する
  let g:indent_guides_auto_colors = 0
  " 奇数インデントのガイドカラー
  hi IndentGuidesOdd  ctermbg=2
  " 偶数インデントのガイドカラー
  hi IndentGuidesEven ctermbg=3

  " ガイドカラーの変化の幅 (Terminal では未サポート)
  "let g:indent_guides_color_change_percent = 20
  " ガイドの幅
  let g:indent_guides_guide_size = 1
  " ガイド幅をタブ幅に合わせる
  "let g:indent_guides_guide_size = &tabstop
endfunction

autocmd FileType python call s:MyFtpluginPython()

"===================================================================
" for Vim setting {{{2
"===================================================================
function! s:MyFtpluginVim()
"  if exists("b:did_ftplugin_vim")
"    finish
"  endif
"  let b:did_ftplugin_vim = 1

  " タブをスペースに展開したいけど、
  " スペース8個分のハードタブ + スペース4つの合わせ技が意外と多い…
  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
endfunction

"===================================================================
" for Lisp setting {{{2
"===================================================================
function! s:MyFtpluginLisp()
"  if exists("b:did_ftplugin_vim")
"    finish
"  endif
"  let b:did_ftplugin_vim = 1

  setlocal expandtab
  setlocal tabstop=2
  setlocal softtabstop=2
  setlocal shiftwidth=2
endfunction

autocmd FileType lisp call s:MyFtpluginLisp()
