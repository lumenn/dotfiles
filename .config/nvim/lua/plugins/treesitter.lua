return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "VeryLazy" },
        opts_extend = { "ensure_installed" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "fish",
                "bash",
                "diff",
                "html",
                "javascript",
                "typescript",
                "json",
                "markdown",
                "markdown_inline",
                "python",
                "toml",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
                "lua",
                "rust",
                "query",
                "dockerfile",
                "go",
                "gomod",
                "gowork",
                "gosum"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ss",
                    node_incremental = "<leader>ni",
                    scope_incremental = "<leader>si",
                    node_decremental = "<leader>sd"
                }
            }
        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        opts = {
            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = true
                },
                highlight_current_scope = {
                    enable = true
                },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = "grr"
                    }
                },
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = "gd",
                        list_definitions = "<leader>ld",
                        list_definitions_toc = false,
                        goto_next_usage = "gnu",
                        goto_previous_usage = "gpu",
                    },
                },
            }
        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["ra"] = "@assignment.rhs",
                        ["la"] = "@assignment.lhs",
                        ["of"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ol"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["oi"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",
                        ["oc"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["ob"] = "@block.outer",
                        ["ib"] = "@block.inner",
                    },
                },
            },
        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {

        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "folke/twilight.nvim",
        opts = {
            dimming = {
                alpha = 0.25,
                color = { "Normal", "#ffffff" },
                term_bg = "#000000",
                inactive = false,
            },
            context = 30,
            treesitter = true,
            expand = {
                "function",
                "method",
                "table",
                "if_statement",
                "block",
            },
            exclude = {},
        },
        config = function()
            require("twilight").setup({

            })
            vim.cmd("TwilightEnable")

        end,
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = false
        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
