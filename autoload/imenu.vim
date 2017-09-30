let s:menus = {}
let s:keys = []

function! imenu#defind(key, menu)
    let s:menus[a:key] = a:menu
    call add(s:keys, a:key)
    exe 'vnoremap <silent> ' . a:key . ' "xs<C-R>=imenu#complete("' . len(s:keys) . '")<Cr>'
endfunction


function! imenu#complete(index) abort
    let list = []
    let select_word = @x
    let menus = get(s:menus, s:keys[a:index - 1], [])
    let g:wsd_menus = menus
    for m in menus
        let item = {}
        let item.abbr = m.name
        let item.word = call(m.func, [select_word])
        let item.dup = 1
        call add(list, item)
    endfor
    call complete(col('.'), list)
    return ''
endfunction
