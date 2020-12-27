"   ┌─────────────────────────────┐
"   │ (Neo)Vim configuration file │
"   │   Author: Vincent RABAH     │
"   │   Update date: 2020-10-23   │
"   └─────────────────────────────┘

" ┌─────────┐
" │ Plugins │
" └─────────┘

if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
    Plug 'tomasr/molokai'
    Plug 'ervandew/supertab'
    Plug 'Raimondi/delimitMate'
    Plug 'majutsushi/tagbar'
    Plug 'scrooloose/nerdtree',                     { 'on':  'NERDTreeToggle' }
    Plug 'junegunn/goyo.vim',                       { 'on':  'Goyo'}
""    Plug 'Yggdroot/indentLine'
    Plug 'docunext/closetag.vim',                   { 'for': 'html'}
    Plug 'pangloss/vim-javascript',                 { 'for': 'javascript' }
    Plug 'tpope/vim-markdown',                      { 'for': 'markdown'}
    Plug 'gorodinskiy/vim-coloresque',              { 'for': ['css', 'sass', 'scss', 'less'] }
    Plug 'rstacruz/sparkup',                        { 'for': ['html', 'xhtml']}
    Plug 'othree/tern_for_vim_coffee',              { 'for': ['javascript', 'coffee'] }
    Plug 'othree/javascript-libraries-syntax.vim',  { 'for': ['javascript', 'coffee'] }
    Plug 'fatih/vim-go',                            { 'for': ['go'], 'do': ':GoUpdateBinaries'} 
    Plug 'zchee/deoplete-go',                       { 'do': 'make'}
    Plug 'SirVer/ultisnips' 
    Plug 'honza/vim-snippets'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ┌────────────────┐
" │ User interface │
" └────────────────┘

if has("termguicolors")     " set true colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors
endif

set clipboard=unnamed " use system clipboard
set timeout
set timeoutlen=750
set ttimeoutlen=250

"NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
   set ttimeout
   set ttimeoutlen=0
   set matchtime=0
endif

syntax on
set synmaxcol=128       " disable syntax on large line
set t_ut=               " fuckin 256colors zones in tmux !!!
set expandtab        	" replace <TAB> with spaces
set tabstop=3
set softtabstop=3 
set shiftwidth=3 
au Filetype javascript setlocal ts=4 sts=4 sw=4
au Filetype markdown   setlocal ts=4 sts=4 sw=4
let mapleader=","
set fillchars+=vert:│
let g:indentLine_char = '│'
let g:indentLine_color_term = 1
colorscheme molokai
set background=light
set number
set backspace=2 " make backspace work like most other apps
set laststatus=2
set nocompatible
set lazyredraw  " Don't redraw while executing macros (better performance)
filetype plugin indent on

let g:toggle=1
"autocmd vimenter * call StatusBarToggle()
highlight CursorLine   ctermbg=blue
highlight CursorColumn ctermbg=blue
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END
"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
nmap <leader>p :set paste!<BAR>set paste?<CR> " ,p toggles paste mode
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>
set pastetoggle=<F2>
"┌──────────────────────────────────────────────────────┐
"│   Auto reload vimrc + push to github when editing it │
"└──────────────────────────────────────────────────────┘
autocmd! bufwritepost .vimrc 
   \ source ~/.vimrc 
autocmd! bufwritepost .vimrc 
   \ execute '! cp .vimrc ~/dotfiles/vimrc' |
   \ execute '! cd ~/dotfiles; git add vimrc ; git commit -m update; git push' 
"autocmd! bufwritepost .bashrc 
"   \ execute '! cp .bashrc dotfiles/bashrc' |
"   \ execute '! cd dotfiles; git add bashrc ; git commit -m update; git push' 
autocmd! bufwritepost .tmux.conf 
   \ execute '! cp .tmux.conf ~/dotfiles/tmux.conf' |
   \ execute '! cd ~/dotfiles; git add tmux.conf ; git commit -m update; git push' 
" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" ┌─────────────┐
" │ Beautifiers │
" └─────────────┘
command! Xselect norm! ggVG
command! Xbeautifyhtml norm! ggVG :!js-beautify --type html -s 2 -q -f -<CR>
command! Xbeautifyjs norm! ggVG :!js-beautify --type js -s 2 -q -f -<CR>
command! Xbeautifycss norm! ggVG :!js-beautify --type css -s 2 -q -f -<CR>
command! Xbeautifyjson :%!python -m json.tool
command! Xindent norm! ggVG='.

"┌─────────────┐
"│ yaml stuffs │
"└─────────────┘
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set foldlevelstart=20

" ┌─────────────────────────────────────────┐
" │ Enable omni completion. (Ctrl-X Ctrl-O) │
" └─────────────────────────────────────────┘
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \ if &omnifunc == "" |
              \         setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif

" ┌──────────────────┐
" │ supertab stuffs  │
" └──────────────────┘
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabClosePreviewOnPopupClose=1
" set completeopt=menuone,longest,preview
let g:SuperTabDefaultCompletionType='context'
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif

" ┌──────────┐
" │  TagBar  │
" └──────────┘
let g:tagbar_usearrows = 1
let g:tagbar_autofocus = 1

" ┌──────────┐
" │ NERDTree │
" └──────────┘
"autocmd vimenter * NERDTree
"autocmd BufNew * wincmd l  " Autofocus to file on NerdTree
let NERDTreeShowHidden=1   " Show hidden files in NerdTree
"autocmd VimEnter * wincmd p
" Close vim if the last open window is nerdtree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ┌─────────────┐
" │ Box drawing │
" └─────────────┘
" ╔═╗┌─┐
" ║ ║│ │
" ╚═╝└─┘
function! WrapThem() range
    let lines = getline(a:firstline,a:lastline)
    let maxl = 0
    for l in lines
        let maxl = len(l)>maxl? len(l):maxl
    endfor
    let h1 = '┌' . repeat('─', maxl+2) . '┐'
    let h2 = '└' . repeat('─', maxl+2) . '┘'
    for i in range(len(lines))
        let ll = len(lines[i])
        let lines[i] = '│ ' . lines[i] . repeat(' ', maxl-ll) . ' │'
    endfor  
    let result = [h1]             " Ligne du haut
    call extend(result, lines)   " Le corps du cadre
    call add(result,h2)           " Ligne du bas
    execute a:firstline.','.a:lastline . ' d'
    let s = a:firstline-1<0?0:a:firstline-1
    call append(s, result)
endfunction
vmap <F4> :call WrapThem()<CR>

" ┌───────────────────┐
" │ Status bar toggle │
" └───────────────────┘
" ┌────────────────────────────────────────────────────────────────┐
" │ %< truncation point                                            │
" │ %n buffer number                                               │
" │ %f relative path to file                                       │
" │ %m modified flag [+] (modified), [-] (unmodifiable) or nothing │
" │ %r readonly flag [RO]                                          │
" │ %y filetype [ruby]                                             │
" │ %= split point for left and right justification                │
" │ %-35. width specification                                      │
" │ %l current line number                                         │
" │ %L number of lines in buffer                                   │
" │ %c current column number                                       │
" │ %V current virtual column number (-n), if different from %c    │
" │ %p percentage file                                             │
" │ %) end of width specification                                  │
" └────────────────────────────────────────────────────────────────┘
"function! StatusBarToggle()
"      hi User1 ctermbg=green ctermfg=darkred 
"      hi User2 ctermbg=red   ctermfg=darkblue
"      hi User3 ctermbg=blue  ctermfg=darkred 
"      if g:toggle==1
"         let g:toggle=0
"         set statusline=
"         set statusline+=%1*        
"         set statusline+=\ %t\    
"         set statusline+=%2*        
"         set statusline+=\ %y\      
"         set statusline+=%3*        
"         set statusline+=%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%p%%)%)
"      else
"         let g:toggle=1
"         set statusline =
"         set statusline+=%2*\ C-n\ Tree\ %3*
"         set statusline+=\ %2*\ C-t\ Tag\ %3*
"         set statusline+=\ %2*\ F4\ Box\ %3*
"         set statusline+=\ %2*\ F9\ Goyo\ %3*
"         set statusline+=\ %2*\ F10\ Toggle\ %3*
"      endif
"endfunction
"nnoremap <silent> <F10> :call StatusBarToggle()<CR> 
nnoremap <silent> <F9>  :Goyo<CR>

"┌──────────────────────┐
"│ Dockerfile Temaplate │
"└──────────────────────┘

au BufNewFile Dockerfile r ~/mysetup/templates/Dockerfile.txt

"┌─────────────────┐
"│ Relative Number │
"└─────────────────┘

set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-l> :call NumberToggle()<cr>

"┌───────────┐
"│ Syntastic │
"└───────────┘
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_html_tidy_ignore_errors = [ '<input> proprietary attribute "role"' ]

ab @ vincent.rabah@gmail.com

"┌──────────────┐
"│ vim-devicons │
"└──────────────┘
let g:webdevicons_enable = 1

"┌─────────┐
"│ airline │
"└─────────┘
let g:airline_theme='violet'

set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'
 if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
let g:airline_symbols.branch = ''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Show buffers in top bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1



function! GoBuf()
  bnext
  echon '    '
  for buf in range(1, bufnr('$'))
    echon '['
    if bufloaded(buf)
      echohl WarningMsg | echon bufname(buf) | echohl None
    else
      echon bufname(buf)
    endif
    echon ']  '
  endfor
endfunction
map <F8> :call GoBuf()<CR>

“ Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

