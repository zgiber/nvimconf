" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" On-demand loading
" Plug 'flazz/vim-colorschemes'
Plug 'cormacrelf/vim-colors-github'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'freeo/vim-kalisi'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter',
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'buoto/gotests-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
" Plug 'preservim/tagbar'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'google/protobuf'
Plug 'dart-lang/dart-vim-plugin'
Plug 'maksimr/vim-jsbeautify'

" Initialize plugin system
call plug#end()

filetype plugin indent on
set swapfile
set backupdir=~/.tmp
set nowrap
set tabstop=4
set shiftwidth=4
set hidden
set number
set ignorecase
set autoread
set autowrite
set fillchars=vert:\│
set listchars=tab:\│\ 
set cursorline
set scrolloff=99
set termguicolors
let g:rehash256 = 1
" let g:molokai_original = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light
set signcolumn=yes
set splitbelow
hi NonText guifg=bg
set mouse=a
colorscheme github
let g:lightline = { 'colorscheme': 'github' }
let g:gitgutter_enabled = 1
set updatetime=500

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <F10> :TagbarToggle<CR>

" DART stuff
let dart_style_guide = 2
let dart_format_on_save = 1
let dart_html_in_string=v:true

" insert semicolon at end of the line
noremap ; A;<ESC>

autocmd FileType c,cpp,java,php,proto,python autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd BufNewFile,BufRead BUILD set syntax=python ts=8 sts=4 et sw=4

let g:racer_cmd = "/Users/zgiber/.cargo/bin/racer"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'github'

map <SPACE> <Leader>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap <C-h> <C-w>h<ESC>
nnoremap <C-l> <C-w>l<ESC>
nnoremap <C-j> <C-w>j<ESC>
nnoremap <C-k> <C-w>k<ESC>

" easymotion basic
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" leader  esc to disable highlighting
nnoremap <Leader><ESC> :noh<CR>

" fzf instead of ctrlp
nnoremap <C-p> :Files<CR>

" fzf tags
nnoremap <Leader>t :Tags<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
"nnoremap <C-p> :Files<CR>
"nnoremap <C-p> :Files<CR>
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Prettify a few file formats
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" close fzf with esc
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" find stuff within files in project
nnoremap <Leader>f<SPACE> :Find
nnoremap <Leader>f<CR> :Find <C-r><C-w><CR>

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" easy close buffers
nnoremap <Leader>q :bp<CR>:bd #<CR>

" exit terminal edit mode with ESC
tnoremap <Esc> <C-\><C-n>

" rust settings
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" set completeopt+=longest
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Loads lua config
lua require('init') 
autocmd BufWritePre *.go lua goimports(1000)

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" " Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
"
"" Avoid showing message extra message when using completion
set shortmess+=c"

