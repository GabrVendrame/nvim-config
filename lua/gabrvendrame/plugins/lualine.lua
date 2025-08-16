return {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
                options = {
                        theme = "auto"
                },
                sections = {
                        lualine_x = { "encoding", { "lsp_status", ignore_lsp = { "null-ls" } }, "filetype" }
                },
                extensions = {
                        "fugitive",
                        "fzf",
                        "lazy",
                        "mason",
                        "toggleterm"
                }
        }
}
