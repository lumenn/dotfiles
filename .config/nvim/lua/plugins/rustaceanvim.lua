return {
    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            }
        },
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require('crates').setup()
        end,
    }
}
