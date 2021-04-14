call plug#begin('~/.vim/plugged')
" Tree
Plug 'kyazdani42/nvim-web-devicons' "file icon
Plug 'kyazdani42/nvim-tree.lua' "actual tree
" colorscheme
Plug 'flazz/vim-colorschemes'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" autopairs (parentheses pairing plugin)
Plug 'jiangmiao/auto-pairs'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" tagbar
Plug 'preservim/tagbar'

call plug#end()

" General
" set syntax "enable syntax highlighting
au Colorscheme * hi Normal ctermbg=black
colorscheme Benokai
set nu "show linum
set background=dark "set background color
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab "set space as tab
" Below is coc-specific general settings
set nobackup nowritebackup "Some servers have issues with backup files -> https://github.com/neoclid/coc.nvim/issues/649
set cmdheight=2 "More space for displaying message
set hidden "TextEdit might fail if hidden is not set

" Tree Config
let g:nvim_tree_auto_open = 1
nnoremap <C-n> :NvimTreeToggle<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>

" CoC
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CocHintSign ctermfg=darkyellow
hi CocErrorSign ctermfg=darkred
" navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" map K to show docs
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
