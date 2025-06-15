return {
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_dir = function() return vim.loop.cwd() end
}
