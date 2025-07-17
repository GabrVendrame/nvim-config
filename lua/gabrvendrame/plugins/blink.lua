return {
        {
                "saghen/blink.cmp",
                event = "VimEnter",
                dependencies = {
                        { "L3MON4D3/LuaSnip" },
                        { "rafamadriz/friendly-snippets" },
                },
                opts = {
                        keymap = {
                                preset = "default",
                                ["<Up>"] = { "select_prev", "fallback" },
                                ["<Down>"] = { "select_next", "fallback" },
                                ["<Enter>"] = { "accept", "fallback" },
                                ["<Tab>"] = { "accept", "fallback" },
                        },

                        completion = {
                                documentation = {
                                        auto_show = false,
                                        auto_show_delay_ms = 500,
                                },
                        },

                        sources = {
                                default = {
                                        "lsp",
                                        "path",
                                        "snippets",
                                        "buffer",
                                },
                        },

                        snippets = {
                                preset = "luasnip",
                        },

                        fuzzy = {
                                implementation = "prefer_rust",
                        },

                        signature = {
                                enabled = true,
                        },
                },
        }
}
