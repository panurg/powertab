" File: powertab.vim
" Author: panurg <panurg@bk.ru>
" Version: 0.01
" WebPage: http://github.com/panurg/powertab
" License: BSD

let s:keepcpo=&cpo
set cpo&vim

function! powertab#ArrowTabLine()
    let s = ''
    let wn = ''
    let t = tabpagenr()
    let i = 1
    if (g:tabbar == 'right') || (g:tabbar == 'right-fancy')
        let s .= '%='
    endif
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ''
        let wn = tabpagewinnr(i,'$')

        if (g:tabbar == 'right-fancy')
            if (i == 1)
                let s .= (i == t ? '%#TabArrowFillSel#' : '%#TabArrowFill#')
                let s .= '⮂'
            else
                let s .= (i-1 == t ? '%#TabArrowNextSel#⮂' : (i == t ? '%#TabArrowSel#⮂' : '%#TabArrow#⮃'))
            endif
        endif

        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        if buftype == 'nofile'
            if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file = fnamemodify(file, ':p:t')
        endif
        if file == ''
            let file = '[No Name]'
        endif
        let s .= ' ' . file . ' '
        if (g:tabbar == 'left-fancy')
            if (i == tabpagenr('$'))
                let s .= (i != t ? '%#TabArrowFill#' : '%#TabArrowFillSel#')
                let s .= '⮀'
            else
                let s .= (i+1 == t ? '%#TabArrowNextSel#⮀' : (i == t ? '%#TabArrowSel#⮀' : '%#TabArrow#⮁'))
            endif
        endif
        let i = i + 1
    endwhile
    if (g:tabbar == 'left') || (g:tabbar == 'left-fancy')
        let s .= '%T%#TabLineFill# %='
    endif
    "let s .= (tabpagenr('$') > 1 ? '%999XX' : '')
    return s
endfunction

let &cpo= s:keepcpo
unlet s:keepcpo

" vim:set et:
