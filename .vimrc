set nocompatible
filetype on 
filetype plugin on
filetype indent on
syntax on
set number
set shiftwidth=4
set tabstop=4
set mouse=a
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=100

" set linebreak
" set textwidth=80

set incsearch
set lazyredraw
set colorcolumn=80

set cursorline

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

     " PLUGINS ---------------------------------------------------------------- {{{

    " Plugin code goes here.
    call plug#begin()

        Plug 'vim-airline/vim-airline'
        Plug 'sainnhe/gruvbox-material'
        Plug 'vim-python/python-syntax'
        "Plug 'morhetz/gruvbox'
        "Plug 'vim-syntastic/syntastic'

    call plug#end()

    let g:python_highlight_all = 1

    >
            " Important!!
            if has('termguicolors')
              set termguicolors
            endif

            " For dark version.
            set background=dark

            " For light version.
            " set background=light

            " Set contrast.
            " This configuration option should be placed before `colorscheme gruvbox-material`.
            " Available values: 'hard', 'medium'(default), 'soft'
            let g:gruvbox_material_background = 'medium'

            " For better performance
            let g:gruvbox_material_better_performance = 1

            " Change Airline theme
            let g:airline_theme = 'gruvbox_material'
            let g:airline_powerline_fonts = 1

            colorscheme gruvbox-material
      <

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
