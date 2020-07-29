
" 24-bit true color: neovim 0.1.5+ / vim 7.4.1799+
" enable ONLY if TERM is set valid and it is NOT under mosh
    function! IsMosh()
        let output = system('~/dotfiles/bin/is_mosh.sh -v')
        if v:shell_error
            return 0
        endif
        return !empty(l:output)
    endfunction
    
    function! s:auto_termguicolors(...)
        if !(has('termguicolors'))
            return
        endif
    
        if (&term == 'xterm-256color' || &term == 'nvim') && !IsMosh()
            set termguicolors
            echom "GUI colors set"
        else
            set notermguicolors
            echom "256 colors set"
        endif
    endfunction

    if has('termguicolors')
        " by default, enable 24-bit color, but lazily disable if under mosh
        set termguicolors
    
        if exists('*timer_start')
            call timer_start(0, function('s:auto_termguicolors'))
        else
            call s:auto_termguicolors()
        endif
    endif