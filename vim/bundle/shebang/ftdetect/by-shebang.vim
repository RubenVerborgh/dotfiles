" Detected shebangs and corresponding filetype
let s:shebangtypes = { 'node': 'javascript' }

" Detect the filetype by shebang
fun! s:DetectByShebang()
  " return if the filetype already exists
  if did_filetype()
    return
  endif

  " check if the first line is a shebang
  let l:firstline = getline(1)
  if l:firstline =~ '^#!'
    " find and set the matching shebang type
    for [shebang, type] in items(s:shebangtypes)
      if l:firstline =~ shebang
        execute 'set filetype=' . type
        return
      end
    endfor
  endif
endfun

autocmd BufNewFile,BufRead * call s:DetectByShebang()
