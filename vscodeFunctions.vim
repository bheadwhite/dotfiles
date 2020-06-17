function! s:showCommands()
    normal! gv
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
endfunction

function! s:openVSCodeCommandsInVisualMode()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
      let startLine = line("v")
      let endLine = line(".")
      call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
  else
      let startPos = getpos("v")
      let endPos = getpos(".")
      call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
endfunction

function! s:copyLinesUpAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.copyLinesUpAction", startLine, endLine, 1)
endfunction

function! s:copyLinesDownAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.copyLinesDownAction", startLine, endLine, 1)
endfunction

function! s:moveLinesUpAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.moveLinesUpAction", startLine, endLine, 1)
endfunction

function! s:moveLinesDownAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.moveLinesDownAction", startLine, endLine, 1)
endfunction

function! s:indentGroup()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.indentLines", startLine, endLine, 1)
endfunction

function! s:outdentGroup()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("outdent", startLine, endLine, 1)
endfunction

function! s:selectTextForPartialDiff()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("extension.partialDiff.markSection1", startLine, endLine, 1)
endfunction

function! s:compareWithSelectedDiff()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("extension.partialDiff.markSection2AndTakeDiff", startLine, endLine, 1)
endfunction

function! s:openToTheSide()
  normal! gv
  call :<C-u> vsp<CR>
  call VSCodeNotify("macros.openToTheSide")
endfunction

xnoremap <silent> <F4> :<C-u>call <SID>indentGroup()<CR>
xnoremap <silent> <S-F4> :<C-u>call <SID>outdentGroup()<CR>