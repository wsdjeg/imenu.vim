let s:menus = {}

function! imenu#defind(key, menu)
    let s:menus[a:key] = a:menu
    exe 'vnoremap <silent> ' . a:key . " \"xs<C-R>=imenu#complete('" . a:key . "')<Cr>"
endfunction


function! imenu#complete(key) abort
    let list = []
    let select_word = @x
    for m in s:menus[a:key]
        let item = {}
        let item.menu = m.name
        let item.word = call(m.func, select_word)
        call add(list, item)
    endfor
    call complete(col('.'), list)
    return ''
endfunction
