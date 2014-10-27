NeoBundle "fuenor/im_control.vim"

set runtimepath+=~/.vim/bundle/im_control

let IM_CtrlMode = 1
inoremap <silent> <C-k>=IMState('FixMode')<CR>


" IBus 1.5(after)
function! IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('ibus engine "mozc-jp"')
  elseif cmd == 'Off'
    let res = system('ibus engine "xkb:us::eng"')
  endif
  return ''
endfunction

set timeout timeoutlen=3000 ttimeoutlen=100
