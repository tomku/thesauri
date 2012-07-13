" Moby Project thesaurus integration for vim
" Author: Tom Kurth <tom@losthalo.org>
" Homepage: http://github.com/tomku/thesauri
" License: GPLv2
" Last Modified: 2012-07-12

fun! CompleteThesauri(findstart, base)
    if a:findstart
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        return start
    else
        if has("win32")
            let output = system("findstr /b \"" . a:base . ",\" " . g:mobythesaurus_file)
        else
            let output = system("grep \"^" . a:base . ",\" " . g:mobythesaurus_file)
        endif

        if v:shell_error
            return []
        else
            let res = []
            for l in split(output, "\n")
                let k = substitute(l, "[^,]\\+,", "", "")
                for i in split(k, ",")
                    call add(res, i)
                endfor
            endfor
            return res
        endif
    endif
endfun

