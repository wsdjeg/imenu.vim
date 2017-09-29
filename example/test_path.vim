let s:menu = []

function! s:file_name(file) abort
    return fnamemodify(a:file, ':t')
endfunction

function! s:relative_path(file) abort
    return fnamemodify(a:file, ':.')
endfunction

function! s:absolute_path(file) abort
    return fnamemodify(a:file, ':p')
endfunction

call add(s:menu, {
            \ 'name' : 'file name',
            \ 'func' : function('s:file_name'),
            \ })
call add(s:menu, {
            \ 'name' : 'relative path',
            \ 'func' : function('s:relative_path'),
            \ })
call add(s:menu, {
            \ 'name' : 'absolute path',
            \ 'func' : function('s:absolute_path'),
            \ })
call imenu#defind('<C-p>', s:menu)
