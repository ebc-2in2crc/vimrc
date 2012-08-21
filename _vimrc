"===================================================================
" Vundle
"===================================================================
set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Erlang-plugin-package'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/vimproc'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'hallettj/jslint.vim'
Bundle 'kana/vim-smartinput'
Bundle 'kana/vim-textobj-fold'
Bundle 'kana/vim-textobj-indent'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'kana/vim-textobj-user'
Bundle 'mattn/zencoding-vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'othree/eregex.vim'
Bundle 'soh335/vim-ref-jquery'
Bundle 'teramako/jscomplete-vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-surround'
Bundle 'tyru/vim-altercmd'
"Bundle 'vim-jp/vimdoc-ja'
Bundle 'vim-scripts/IndentAnything'
Bundle 'vim-scripts/JavaScript-syntax'
Bundle 'vim-scripts/Javascript-Indentation'
Bundle 'vim-scripts/MultipleSearch'
Bundle 'vim-scripts/TwitVim'
Bundle 'vim-scripts/vimwiki'

filetype plugin indent on

" デフォルトでバックスラッシュだけど明示的に指定してみる
let mapleader = "\"

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

"===================================================================
" search
"===================================================================
" 最後まで調べたら先頭へ戻る
set wrapscan
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

" 検索にヒットした行をページ中央に表示
nnoremap * *zz
nnoremap # #zz
nnoremap n nzz
nnoremap N Nzz

" keymap, move
nnoremap j gj
nnoremap k gk

" keymap, tab-page
nnoremap <C-j> :<C-u>tabnext<CR>
nnoremap <C-k> :<C-u>tabprevious<CR>
"map <D-[> <Esc>:tabnext<CR>
"map <D-]> <Esc>:tabprevious<CR>
"map <D-j> <Esc>:tabnext<CR>
"map <D-k> <Esc>:tabprevious<CR>
"nnoremap <Tab> :tabnext<CR>
"nnoremap <S-Tab> :tabprevious<CR>

" 検索結果の強調表示をやめる
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" clipboard
set clipboard=unnamed

" ファイルパスの置き換え
inoremap <expr> <C-r>p% expand('%:p')
inoremap <expr> <C-r>h% expand('%:p:h')

" ヘルプを三倍の速さで引く
nnoremap <C-h> :<C-u>help<Space>

" カーソル位置から行末までヤンク
nnoremap Y y$

" カーソル行をハイライト
set cursorline

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
let gvimrcbody = '$HOME/.gvimrc'

function! OpenFile(file)
  let empty_buffer = line('$') == 1 && strlen(getline('1')) == 0
  if empty_buffer && !&modified
    execute 'e ' . a:file
  else
    execute 'tabnew ' . a:file
  endif
endfunction

command! OpenMyVimrc call OpenFile(vimrcbody)
command! OpenMyGVimrc call OpenFile(gvimrcbody)
nnoremap <Space><Space> :<C-u>OpenMyVimrc<CR>
nnoremap <Space><Tab> :<C-u>OpenMyGVimrc<CR>

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
  echo 'Reloaded vimrc and gvimrc.'
endfunction

" ターミナルだと $MYVIMRC が空なのはなぜだろう…
nnoremap <F5> :<C-u>execute ":source " vimrcbody<CR>
\ :call SourceIfExists('~/.vim/ftplugin/' . &filetype . '.vim')<CR>

"\ :<C-u>execute ":source " gvimrcbody<CR>
"===================================================================
" デフォルトの文字コード
"===================================================================
set encoding=utf-8

"===================================================================
" color setting
"===================================================================
syntax enable
set background=dark
"set background=light

"let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
"colorscheme desert

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
  set guifont=Ricty\ Discord:h18
elseif has('mac')
  set guifont=Ricty\ Discord:h18
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

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
" neocomplcache
"===================================================================
" Use neocompcache.
let g:neocomplcache_enable_at_startup = 1
" Use ignorecase
let g:neocomplcache_enable_ignore_case = 1
" Use smartcase
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion (Have side effects)
"let g:neocomplcache_enable_camel_case_completion
" Use underbar completion (Have side effects)
"let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" スニペットファイルの場所
let g:neocomplcache_snippets_dir = $HOME.'/.neocon-snippets'

imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"


" 補完の取消
inoremap <expr><C-g> neocomplcache#undo_completion()
" シェルっぽい補完
"inoremap <expr><C-l> neocomplcache#complete_common_string()
" 1番目の候補を自動選択
let g:neocomplcache_enable_auto_select = 1
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" JS omnifunc: jscomplete-vim#CompleteJS
" JavaScript の補完には jscomplete-vim を使用する
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

"===================================================================
" jscomplete-vim
"===================================================================
" JavaScirpt の omnifunc を設定する
autocmd FileType javascript :setlocal omnifunc=jscomplete#CompleteJS

"===================================================================
" vimfiler
"===================================================================
" アンセーフモード
let g:vimfiler_safe_mode_by_default = 0
" vimfiler 起動
nnoremap <Space>f :<C-u>VimFiler<CR>

"===================================================================
" Twitvim
"===================================================================
let twitvim_count = 40
let twitvim_browser_cmd = "open -a 'Google Chrome'"
let twitvim_filter_enable = 0
nnoremap <Space>tt :<C-u>PosttoTwitter<CR>
nnoremap <Space>tf :<C-u>FriendsTwitter<CR><Esc><C-w><C-w>
nnoremap <Space>tu :<C-u>UserTwitter<CR><Esc><C-w><C-w>
nnoremap <Space>tr :<C-u>MentionsTwitter<CR><Esc><C-w><C-w>
nnoremap <Space>td :<C-u>DMTwitter<CR><C-w><C-w>
nnoremap <Space>ts :<C-u>DMSentTwitter<CR><C-w><C-w>
nnoremap <Space>tn :<C-u>NextTwitter<CR>
nnoremap <Space>tp :<C-u>PreviousTwitter<CR>
nnoremap <Leader><Leader> :<C-u>RefreshTwitter<CR><C-w><C-w>

" Search #TokyoVim
nnoremap <Space>ss :<C-u>SearchTwitter #TokyoVim<CR>

"===================================================================
" eregex.vim
"===================================================================
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

"===================================================================
" jslint.vim
"===================================================================
" 基本的に JSLint は無効にしておく
" 明示的にコマンド実行時、またはファイル保存時のみ実行する
" (この設定は Additional ftplugin で行う)

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
  autocmd QuickFixCmdPost helpgrep copen
  autocmd QuickFixCmdPost vimgrep copen
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
" alc
"nnoremap <Space>ra :<C-u>Ref alc<Space>
"let g:ref_alc_start_linenumber = 40

" jquery
nnoremap <Space>jq :<C-u>Ref jquery<Space>
let g:ref_jquery_path = expand("~/.vim/bundle/vim-ref-jquery/jqapi-docs/")

"===================================================================
" command-line window
"
" Hack #161: Command-line windowを使いこなす
" http://vim-users.jp/2010/07/hack161/
"===================================================================
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>
nnoremap q: q:<Esc>

nmap : <sid>(command-line-enter)
xmap : <sid>(command-line-enter)

function! s:enter_cmdwin()
  call altercmd#define('b', 'gr[ep]', 'Grep', 'i')
  " 下記の書き方でも良い
  " AlterCommand <buffer><mode:i> gr[ep] Grep

  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <Tab> :<C-u>quit<CR>

  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
  inoremap <buffer><expr><BS> neocomplcache#smart_close_popup() . "\<C-h>"
  inoremap <buffer> <C-c> <Esc>

  " Completion
  inoremap <buffer><expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

  " 自動補完されると q みたいな短いコマンドが打ちにくいので
  " neocomplcache の動作する文字列長を調整
  NeoComplCacheAutoCompletionLength 2

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
augroup END

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

  "===================================================================
  " jslint.vim
  "===================================================================
  " 基本的に JSLint は無効にしておく
  " 明示的にコマンド実行時、またはファイル保存時のみ実行する

  " 基本的に JSLint は無効にしておく
  let b:jslint_disabled = 1

  function! JsLintRun()
    let b:jslint_disabled = 0
    execute 'JSLintUpdate'
    let b:jslint_disabled = 1
  endfunction

  command! JsLintRunCommand call JsLintRun()
  nnoremap <Space>jl :<C-u>JsLintRunCommand<CR>:copen<CR>

  augroup javascriptopen
    autocmd!
    autocmd BufWritePost <buffer> call JsLintRun()
  augroup END
endfunction

autocmd FileType javascript call s:MyFtpluginJavaScript()

"===================================================================
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
  "setlocal expandtab
  setlocal tabstop=8
  setlocal softtabstop=8
  setlocal shiftwidth=8
endfunction

autocmd FileType vim call s:MyFtpluginVim()
