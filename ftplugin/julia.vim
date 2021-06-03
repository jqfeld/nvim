let maplocalleader = " "

nmap <localleader>it    <Plug>(iron-send-motion)
vmap <localleader>iv    <Plug>(iron-visual-send)
nmap <localleader>ir    <CMD>:IronRestart<CR>
nmap <localleader>il    <Plug>(iron-send-line)
nmap <localleader><CR> <Plug>(iron-cr)
nmap <localleader>ii    <plug>(iron-interrupt)
nmap <localleader>iq    <Plug>(iron-exit)
nmap <localleader>ic    <Plug>(iron-clear)
" nmap <localleader>ia    <Cmd>:w <bar> :call luaeval("require('iron').core.send(_A[1], _A[2])", [&ft, "include(\"".expand("%")."\")"])<CR>
nmap <localleader>ia    <Cmd>:w <bar> :call luaeval("require('iron').core.send(_A[1], _A[2])", [&ft, join(getline(1,'$'), "\n")])<CR>
nmap <localleader>if    <CMD>:IronFocus<CR>
