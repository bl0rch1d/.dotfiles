call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
"Plug 'kien/ctrlp.vim'
"Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline-themes'

Plug 'pangloss/vim-javascript'

call plug#end()

"set t_Co=256
"let g:airline_powerline_fonts = 1
"let g:airline_theme='wombat'

syntax enable

set number

set expandtab
set tabstop=2
set shiftwidth=2
set smartindent

set backspace=indent,eol,start

colorscheme hybrid
set background=dark
highlight Normal ctermbg=none
highlight LineNr ctermfg=red

set hlsearch
set incsearch

map <C-n> :NERDTreeToggle<CR>

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


map <silent> <C-p> :FZF<CR>
