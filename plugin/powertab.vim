" File: powertab.vim
" Author: panurg <panurg@bk.ru>
" Version: 0.01
" WebPage: http://github.com/panurg/powertab
" License: BSD
" Desription: modifies vim tabline to look like statusline with powerline
" plugin; initial idea of the plugin and realistion are belong to anonymous from
" iichan.hk imageboard

if exists("g:loaded_powertab") || &cp
  finish
endif
let g:loaded_powertab=001 " your version number
let s:keepcpo=&cpo
set cpo&vim

if exists("+tabline")
    if (g:colors_name == "solarized")
        let g:Powerline_colorscheme = 'solarized'
        hi! TabArrowNextSel cterm=inverse guibg=#268bd2 guifg=#586e75
        hi! TabArrowSel cterm=inverse guifg=#268bd2 guibg=#586e75
        hi! TabArrow cterm=inverse guibg=#586e75 guifg=#eee8d5
        hi! TabArrowFillSel cterm=inverse guibg=#fdf6e3 guifg=#268bd2 guisp=#657b83
        hi! TabArrowFill cterm=inverse guibg=#fdf6e3 guifg=#586e75 guisp=#657b83
        hi! TabLineFill term=NONE guifg=#657b83 guibg=#fdf6e3 guisp=#657b83
        hi! TabLineSel term=NONE cterm=bold gui=bold guifg=#eee8d5 guibg=#268bd2 guisp=#657b83
        hi! TabLine cterm=NONE ctermfg=0 ctermbg=7 guifg=#eee8d5 guibg=#586e75 guisp=#657b83
    else
        if (g:colors_name == "zenburn")
            hi! TabLine cterm=NONE ctermfg=0 ctermbg=7 guifg=#9e9e9e guibg=#585858 guisp=#657b83 gui=NONE
            hi! TabLineSel term=NONE cterm=bold gui=NONE guifg=#242424 guibg=#d0d0d0 guisp=#657b83
            hi! TabLineFill term=NONE guifg=#ff0000 guibg=#303030 guisp=#657b83
            hi! TabArrowNextSel cterm=inverse guibg=#d0d0d0 guifg=#585858
            hi! TabArrowSel cterm=inverse guifg=#d0d0d0 guibg=#585858
            hi! TabArrow cterm=inverse guibg=#585858 guifg=#9e9e9e
            hi! TabArrowFillSel cterm=inverse guibg=#303030 guifg=#d0d0d0 guisp=#657b83
            hi! TabArrowFill cterm=inverse guibg=#303030 guifg=#585858 guisp=#657b83
        endif
    endif

    if !exists('g:tabbar')
        let g:tabbar = 'left-fancy'
    endif
    set stal=2
    set tabline=%!powertab#ArrowTabLine()
    " weird link
    " highlight link TabArrow Special
endif

let &cpo= s:keepcpo
unlet s:keepcpo

" vim:set et:
