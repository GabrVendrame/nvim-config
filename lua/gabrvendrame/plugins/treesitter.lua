return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
                ensure_installed = {
                        "bash",
                        "dockerfile",
                        -- "go",
                        "javascript",
                        "jsdoc",
                        "lua",
                        "python",
                        "sql",
                        "typescript",
                        "vimdoc",
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
}
