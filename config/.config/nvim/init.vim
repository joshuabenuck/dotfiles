syntax enable
filetype plugin on

set nu
autocmd FileType coffee setlocal sw=2 ts=2 et ai
autocmd FileType javascript setlocal sw=2 ts=2 et ai

set omnifunc=syntaxcomplete#Complete

colorscheme elflord

augroup custom_hooks
    autocmd!
    autocmd bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
augroup END

let mapleader = '\'
map <leader>r :source ~/.config/nvim/init.vim<CR>
map <leader>i :edit ~/.config/nvim/init.vim<CR>
map <leader>. :edit .<CR>
map <leader>c :set cursorcolumn!<CR>
map <leader>h :set hls!<CR>

call plug#begin()
Plug 'ludovicchabant/vim-gutentags' ", { 'for': ['go', 'java', 'python', 'ruby', 'conf', 'javascript'] }
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" Configuration
let g:NERDTreeIgnore = ['\.DS_Store$', '\.git$', '\.vagrant', '\.idea', 'node_modules']
let g:NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen=1
"let g:ale_sign_error = '•'
"let g:ale_sign_warning = '•'
"let g:gitgutter_sign_added = '┃'
"let g:gitgutter_sign_modified = '┃'
"let g:gitgutter_sign_removed = '┃'
let g:gutentags_cache_dir = '~/.config/nvim/ctags'
"let g:surround_no_insert_mappings = 1 " unmap surround weirdness
"let g:vimwiki_global_ext = 0
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Plugins
map <leader>t :NERDTreeToggle<CR>

