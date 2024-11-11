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
  -- adds popup in nvim terminal 
  {
    'voldikss/vim-floaterm'
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    }
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
})

