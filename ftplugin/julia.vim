let maplocalleader = " "

nmap <localleader>t    <Plug>(iron-send-motion)
vmap <localleader>v    <Plug>(iron-visual-send)
nmap <localleader>r    <Plug>(iron-repeat-cmd)
nmap <localleader>l    <Plug>(iron-send-line)
nmap <localleader><CR> <Plug>(iron-cr)
nmap <localleader>i    <plug>(iron-interrupt)
nmap <localleader>q    <Plug>(iron-exit)
nmap <localleader>c    <Plug>(iron-clear)
nmap <localleader>a    <Cmd>:call luaeval("require('iron').core.send(_A[1], _A[2])", [&ft, "include(\"".expand("%")."\")"])<CR>
nmap <localleader>j    <CMD>:IronFocus<CR>
