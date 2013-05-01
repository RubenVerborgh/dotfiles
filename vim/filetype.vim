if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.json set filetype=json
  au! BufRead,BufNewFile *.tex	set filetype=tex
augroup END
