local builtin = require('telescope.builtin')

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
      spec = {
          {
              mode = { "n", "v" },
              {
                  "<leader>w",
                  group = "Save",
              },
              {
                  "<leader>e",
                  group = "Explore",
              },
              {
                  "<leader>f",
                  group = "Find",
              },
              {
                  "<leader>c",
                  group = "Code Actions",
              }
          }
      }
  },
  keys = {
      {
          "<leader>?",
          function()
              require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
      },
      {
          "<leader>q",
          "<cmd>q<cr>",
          desc = "Close current window",
      },
      {
          "<leader>ww",
          "<cmd>w<cr>",
          desc = "Write File",
      },
      {
          "<leader>wq",
          "<cmd>wq<cr>",
          desc = "Write File & Quit",
      },
      {
          "<leader>ee",
          "<cmd>Explore<cr>",
          desc = "File explorer"
      },
      {
          "<leader>ff",
            function ()
                builtin.find_files()
            end,
          desc = "Telescope find files"
      },
      {
          "<leader>fg",
            function ()
               builtin.live_grep()
            end,
          desc = "Telescope live grep"
      },
      {
          "<leader>ca",
            function()
                vim.cmd.RustLsp('codeAction')
            end,
          desc = "Code Action"
      },
      {
          "<leader>cd",
            function()
                vim.cmd.RustLsp({ 'renderDiagnostic', 'current'})
            end,
          desc = "Code Diagnostics"
      },
      {
          "<leader>ce",
            function()
                vim.cmd.RustLsp({ 'explainError', 'current'})
            end,
          desc = "Code Explain Error"
      },
      {
          "K",
            function()
                vim.cmd.RustLsp({'hover', 'actions'})
            end,
          desc = "Hover"
      }
  },
}
