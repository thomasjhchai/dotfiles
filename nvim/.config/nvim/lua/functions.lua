-- for reload init.lua key binding

function reload_lua()
    vim.cmd([[luafile $XDG_CONFIG_HOME/nvim/init.lua]])
    vim.notify('NVIM RELOADED')
end

