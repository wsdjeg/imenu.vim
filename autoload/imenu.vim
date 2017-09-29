let s:menus = {}

function! imenu#defind(key, menu)
    let s:menus[a:key] = a:menu
    exe 'vnoremap <silent> ' . a:key . " \"xs<C-R>=imenu#complete('" . a:key . "<Cr>"
endfunction


function! imenu#complete(key) abort
    let list = []
    let select_word = @x
    let menus = get(s:menus, a:key, [])
    let g:wsd_menus = menus
    for m in menus
        let item = {}
        let item.abbr = m.name
        let item.word = call(m.func, [select_word])
        call add(list, item)
    endfor
    call complete(col('.'), list)
    return ''
endfunction

function! Test() abort
    let g:wsd = s:menus
    echo s:menus
endfunction
  
