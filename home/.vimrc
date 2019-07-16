set encoding=utf-8
" let g:python3_host_prog = $PYENV_ROOT.'/shims/python3'

" vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Plug 'Shougo/neocomplcache'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
Plug 'ycm-core/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'rking/ag.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'jason0x43/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-jp/vim-cpp'
Plug 'justmao945/vim-clang'
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-jade'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'szw/vim-tags'
Plug 'lambdalisue/vim-pyenv'
Plug 'davidhalter/jedi-vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'simeji/winresizer'
Plug 'mechatroner/rainbow_csv'
call plug#end() " Initialize plugin system

" Colorscheme and syntax
" Refer to https://github.com/altercation/vim-colors-solarized/blob/master/README.mkd
let g:solarized_termtrans=1

filetype plugin indent on " Automatically detect file types.
syntax enable

set background=dark
colorscheme solarized

set number
set notitle
set showmatch
set noswapfile
set eol
set ttyfast
set nobackup
set noswapfile

" Indent, Tab, Space
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
set cursorcolumn

highlight CursorColumn ctermbg=darkgray

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" HighlitTrailingSpaces
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Delete Spaces on save
autocmd BufWritePre * :%s/\s\+$//ge

" Search
set incsearch
set ignorecase
set smartcase
set wrapscan

" For clipboard
set clipboard+=unnamed,autoselect

" Cron
set backupskip+=/home/tmp/*,/private/tmp/*

" nerdtree:
" Open nerdtree automatically
" autocmd vimenter * if !argc() | NERDTree | endif
" Display hidden file
let g:NERDTreeShowHidden = 1
" Display nerdtree when opening a new tab
let g:nerdtree_tabs_open_on_new_tab=1
" Disable vim-markdown folding configuration
let g:vim_markdown_folding_disabled = 1


" neocomplcache:
" Disable AutoComplPop
" let g:acp_enableAtStartup = 0
" Use neocomplcache
" let g:neocomplcache_enable_at_startup = 1
" Use smartcase
" let g:neocomplcache_enable_smart_case = 1
" Use camel case completion
" let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion
" let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary
" let g:neocomplcache_dictionary_filetype_lists = {
" \ 'default' : '',
" \ 'vimshell' : $HOME.'/.vimshell_hist',
" \ 'scheme' : $HOME.'/.gosh_completions'
" \ }
"let g:neocomplcache_force_overwrite_completefunc=1
" Define keyword
" if !exists('g:neocomplcache_keyword_patterns')
"   let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" vim-clang
" disable auto completion for vim-clang
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'


" ctags
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"


" closetag.vim
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


" winresizer
let g:winresizer_vert_resize = 2
let g:winresizer_horiz_resize = 2


" YouCompleteMe
set splitbelow
let g:ycm_global_ycm_extra_conf = '${HOME}/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_insertion = 1
