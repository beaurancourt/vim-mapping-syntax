if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal indentexpr=GetMappingIndent(v:lnum)
setlocal indentkeys&
setlocal indentkeys+==end;,==const,==type,==var,==begin,==repeat,==until,==for
setlocal indentkeys+==program,==function,==procedure,==object,==private
setlocal indentkeys+==record,==if,==else,==case

if exists("*GetMappingIndent")
  "	finish
endif

function! s:GetPrevNonCommentLineNum( line_num )

	" Skip lines starting with a comment
	let SKIP_LINES = '^\s*\(\((\*\)\|\(\*\ \)\|\(\*)\)\|{\|}\)'

	let nline = a:line_num
	while nline > 0
		let nline = prevnonblank(nline-1)
		if getline(nline) !~? SKIP_LINES
			break
		endif
	endwhile

	return nline
endfunction


function! GetMappingIndent( line_num )
	" Line 0 always goes at column 0
	if a:line_num == 0
		return 0
	endif

	let this_codeline = getline( a:line_num )
	let prev_codeline_num = s:GetPrevNonCommentLineNum( a:line_num )
	let prev_codeline = getline( prev_codeline_num )
	let indnt = indent( prev_codeline_num )
  if this_codeline =~ '^[^;]*\]\s*$'
    if prev_codeline =~ '^[^;]*\[\s*$'
      return indnt
    endif
    return indnt - 2
  endif
  if prev_codeline =~ '^[^;]*\[\s*$'
    return indnt + 2
  endif
  return indnt
endfunction

