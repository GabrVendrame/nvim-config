return {
        {
                "tpope/vim-fugitive",
                config = function()
                        -- TODO: set a description to the remap for
                        -- a better use of the which-key plugin
                        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
                end
        },

}
