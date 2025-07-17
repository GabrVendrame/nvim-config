return {
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                main = "nvim-treesitter.configs",
                opts = {
                        ensure_installed = {
                                "dockerfile",
                                "go",
                                "json",
                                "lua",
                                "luadoc",
                                "python",
                                "sql",
                                "typescript",
                                "vim",
                                "vimdoc",
                                "yaml",
                        },
                        auto_install = true,
                        highlight = {
                                enable = true,
                                additional_vim_regex_highlighting = false,
                        },
                        indent = {
                                enable = true,
                        },
                },
        },

        { "nvim-treesitter/playground" },
}
