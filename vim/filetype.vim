if exists("did_load_filetypes")
  finish
endif

" Fix file type detection for these formats
augroup filetypedetect
  au! BufRead,BufNewFile *.json set filetype=json
  au! BufRead,BufNewFile *.tex	set filetype=tex
  au! BufRead,BufNewFile *.md 	set filetype=markdown
  au! BufRead,BufNewFile * call s:DetectByShebang()
augroup END

" Detected shebangs and corresponding filetype
let s:shebangtypes = { 'node': 'javascript' }

" Detect the filetype by shebang
fun! s:DetectByShebang()
  " return if the filetype was already determined
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
