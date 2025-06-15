return {
    {
        "saghen/blink.cmp",
        opts = {
            appearance = {
                nerd_font_variant = "normal"
            },
            keymap = {
                preset = "enter"
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" }
            },
            fuzzy = {
                implementation = "lua",
                prebuilt_binaries = {
                    download = true,
                    force_version = "v1.1.1"
                },
            },
            signature = {
                enabled = true
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind" },
                            { "source_name" },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                },
            },
        },
        opts_extend = { "sources.default" }
    },
}

