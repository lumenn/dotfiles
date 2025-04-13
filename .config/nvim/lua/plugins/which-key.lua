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
      }
  },
}
