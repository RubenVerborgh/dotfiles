" Wrap words with a TeX command
nmap <Leader>lm ysiw}i\<ESC>a
vmap <Leader>lm <Plug>LatexWrapSelection

" Emphasize text
let b:surround_{char2nr('e')} = "\\emph{\r}"
let b:surround_{char2nr('b')} = "\\strong{\r}"
let b:surround_{char2nr('u')} = "\\uline{\r}"
