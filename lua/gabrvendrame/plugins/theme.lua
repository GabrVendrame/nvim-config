return {
        {
                "scottmckendry/cyberdream.nvim",
                priority = 1000,
                lazy = false,
                config = function()
                        require("cyberdream").setup({
                                italic_comments = true,
                                highlights = {
                                        Comment = {
                                                fg = "#696969",
                                                bg = "NONE",
                                                italic = true,
                                        },
                                },
                        })

                        vim.cmd.colorscheme("cyberdream")
                end,
        }
}
