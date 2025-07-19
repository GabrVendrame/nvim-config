return {
        {
                "tpope/vim-fugitive",
                config = function()
                        local opts = {
                                desc = "Opens a git interface"
                        }
                        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, opts)
                end
        },

}
