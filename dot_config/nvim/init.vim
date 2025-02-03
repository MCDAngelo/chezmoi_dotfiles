set runtimepath^=~/.config/nvim runtimepath+=~/after
let &packpath=&runtimepath
luafile ~/.config/nvim/lua/init.lua
