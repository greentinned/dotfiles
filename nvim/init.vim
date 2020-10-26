call plug#begin('~/.config/nvim/plugged/')
" Colors
Plug 'dguo/blood-moon', {'rtp': 'applications/vim'}
Plug 'greentinned/vim-code-dark'
Plug 'chriskempson/base16-vim'
" Syntax
Plug 'dart-lang/dart-vim-plugin'
" Lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Other
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'luochen1990/rainbow'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-surround'
call plug#end()

" BASIC:
" colorscheme blood-moon
colorscheme codedark
set expandtab
set updatetime=300		" Delay before show floating window
set hidden                      " No confirm when change buffers
set nocompatible
set signcolumn=yes
hi clear SignColumn
hi Normal ctermbg=None

" KEYS:
nnoremap <leader>so :so $MYVIMRC<CR>
nnoremap <leader>vr :sp $MYVIMRC<CR>
nnoremap <CR> :nohl<CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" CURSOR:
set cursorline

" FILE TYPES:
autocmd Filetype help nnoremap <buffer> q :q<CR>
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType netrw setlocal bufhidden=delete

" FINDING FILES:
set path+=**                                  " Search down into subfolders
set wildmenu                                  " Display all matching files when we tab complete

" STATUSLINE:
set statusline=
set statusline+=\                             " blank space
" set statusline+=%#Pmenu#
set statusline+=%{expand('%:p:h:t')}/%t       " current file path
set statusline+=\                             " blank space
set statusline+=%m                            " modified flag [+]
" set statusline+=%#LineNr#
set statusline+=\                             " blank space
:set statusline+=line:%l                           " Current line
set statusline+=\                             " blank space
set statusline+=%=                            " right-align from now on
set statusline+=\                             " blank space
set statusline+=%{&filetype}                  " filetype
"set statusline+=%{StatusDiagnostic()}        " Syntastic error flag
set statusline+=\                             " blank space

" VIMLSP:
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_virtual_text_enabled = 0

" Diagnostics gutter signs
let g:lsp_signs_error = {'text': '>>'}
let g:lsp_signs_information = {'text': '>>'}
let g:lsp_signs_warning = {'text': '>>'}
let g:lsp_signs_hint = {'text': '>>'}

" Diagnostics colors
highlight LspErrorText cterm=underline ctermfg=red
highlight LspErrorHighlight cterm=underline ctermfg=red
highlight LspWarningText cterm=underline ctermfg=yellow
highlight LspWarningHighlight cterm=underline ctermfg=yellow
highlight LspInformationText cterm=underline ctermfg=blue
highlight LspInformationHighlight cterm=underline ctermfg=blue
highlight LspHintText cterm=underline ctermfg=green
highlight LspHintHighlight cterm=underline ctermfg=green

" Keys and some other bindnings
function! s:on_lsp_buffer_enabled() abort
    autocmd BufWritePre * silent LspDocumentFormatSync
    " setlocal omnifunc=lsp#complete
    " if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>aw <plug>(lsp-code-action)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" RAINBOW:
let g:rainbow_active = 1

" DIRVISH:
let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd FileType dirvish silent keeppatterns g@\v/\.[^\/]+/?$@d _

" COMMENTARY:
" autocmd FileType tidal setlocal commentstring=--\ %s

