call plug#begin('~/.vim/plugged')

"Fuzzy files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Utils
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

"Ruby/RoR
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

"Color themes
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline-themes'

"JS
Plug 'pangloss/vim-javascript'

"Lintering engine
Plug 'dense-analysis/ale'

call plug#end()

set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

syntax enable

set number

set expandtab
set tabstop=2
set shiftwidth=2
set smartindent

set backspace=indent,eol,start

"colorscheme hybrid
set background=dark
highlight Normal ctermbg=none
highlight LineNr ctermfg=red

set hlsearch
set incsearch

map <C-B> :NERDTreeToggle<CR>

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key

  if (t:curwin == winnr())
    if (match(a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif

    exec "wincmd ".a:key
  endif
endfunction

"set hidden
nnoremap <C-\> :tabn<CR>
nnoremap <C-_> :tabp<CR>

map <C-p> :Files<CR>

"Ale config
let g:ale_linters = { 'javascript': ['eslint'], 'ruby': ['rubocop'] }
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
