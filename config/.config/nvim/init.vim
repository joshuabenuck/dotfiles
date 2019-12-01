syntax enable
filetype plugin on

set nu
augroup coffee
    autocmd!
    autocmd FileType coffee setlocal sw=2 ts=2 et ai
    autocmd FileType coffee setlocal foldmethod=indent foldlevel=99
augroup END

augroup javascript
    autocmd!
    autocmd FileType javascript setlocal sw=2 ts=2 et ai
    autocmd FileType javascript setlocal foldmethod=syntax foldlevel=99
augroup END

augroup html
    autocmd!
    autocmd FileType html setlocal sw=2 ts=2 et ai
    autocmd FileType html setlocal foldmethod=syntax foldlevel=99
augroup END

let javaScript_fold=1
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
map <leader>f :Files<CR>
map <leader>h :set hls!<CR>

call plug#begin()
if has('macunix')
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'ludovicchabant/vim-gutentags' ", { 'for': ['go', 'java', 'python', 'ruby', 'conf', 'javascript'] }
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Configuration
let g:rustfmt_autosave = 1
let g:NERDTreeIgnore = ['\.DS_Store$', '\.git$', '\.vagrant', '\.idea', 'node_modules']
let g:NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen=1
"let g:ale_sign_error = '•'
"let g:ale_sign_warning = '•'
"let g:gitgutter_sign_added = '┃'
"let g:gitgutter_sign_modified = '┃'
"let g:gitgutter_sign_removed = '┃'
let g:gutentags_cache_dir = '~/.config/nvim/ctags'
let g:gutentags_define_advanced_commands=1
"let g:gutentags_trace=1
"let g:surround_no_insert_mappings = 1 " unmap surround weirdness
"let g:vimwiki_global_ext = 0
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

if executable('rls')
    au User lsp_setup call lsp#register_server({
	    \ 'name': 'rls',
	    \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
	    \ 'whitelist': ['rust'],
	    \ })
endif 


autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
" set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ }

        " Automatically start language servers.
        let g:LanguageClient_autoStart = 1

        " Maps K to hover, gd to goto definition, F2 to rename
        nnoremap <silent> K :call LanguageClient_textDocument_hover()
        nnoremap <silent> gd :call LanguageClient_textDocument_definition()
        nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

" Plugins
map <leader>t :NERDTreeToggle<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap <leader>s :Ag<SPACE>

" bind K to grep word under cursor
nnoremap K :Ag <C-R><C-W><CR>

