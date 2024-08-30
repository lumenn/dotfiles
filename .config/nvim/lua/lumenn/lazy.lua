local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- debugger
  {
    'mfussenegger/nvim-dap',
  },
  --
  'folke/which-key.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  -- theme
  {
    'akinsho/horizon.nvim',
    config = function()
      local color = color or 'horizon'
      vim.cmd.colorscheme(color)

      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },
  -- language server
  {'neovim/nvim-lspconfig'},
  {'williamboman/mason.nvim'},
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim'
    }
  },
  -- autocomplete
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-nvim-lsp-signature-help'},
  {'hrsh7th/cmp-nvim-lua'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-vsnip'},
  {'hrsh7th/nvim-cmp'},
  {'onsails/lspkind.nvim'},
  -- snippets
  {'L3MON4D3/LuaSnip'},
  {'m4xshen/autoclose.nvim'},
  {
    'iamcco/markdown-preview.nvim',
    cmd = {'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop'},
    ft = {'markdown'},
    build = function() vim.fn['mkdp#util#install']() end,
  },
  {'brenoprata10/nvim-highlight-colors'},
  {
    'TheLeoP/powershell.nvim',
    opts = {
      bundle_path = vim.fn.stdpath 'data' .. '/mason/packages/powershell-editor-services'
    }
  },
  -- AI Support
  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function ()
      require('chatgpt').setup({
        openai_params = {
          model = '',
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1
        }
      })
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'echasnovski/mini.nvim',
      'nvim-tree/nvim-web-devicons'
    }
  },
  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    'voldikss/vim-floaterm'
  }


})

