" Generate synctex info on compilation
let g:LatexBox_latexmk_options="-synctex=1"

" Opens the output file on the position corresponding to the current line
function! Latex_ViewCurrentLine()
	let outfile = LatexBox_GetOutputFile()
  silent execute '!/Applications/Skim.app/Contents/SharedSupport/displayline '.
					\ '-r -b -g '.line('.').' "'.outfile.'" "'.expand("%:p").'"'

	if !has('gui_running')
		redraw!
	endif
endfunction

map <buffer> <LocalLeader>ls :call Latex_ViewCurrentLine()<CR>
