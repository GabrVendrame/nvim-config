local function remap(mode, lhs, rhs, desc, expr, silent)
        local opts = {
                desc = desc or nil,
                expr = expr or false,
                silent = silent or false,
        }
        vim.keymap.set(mode, lhs, rhs, opts)
end

return {
        {
                "github/copilot.vim",
                config = function()
                        remap("n", "<leader>cst", "<cmd>Copilot status<cr>", "Copilot status")
                        remap("n", "<leader>con", "<cmd>Copilot enable<cr>", "Turn on copilot")
                        remap("n", "<leader>cof", "<cmd>Copilot disable<cr>", "Turn off copilot")
                        remap("i", "<C-a>", "copilot#Accept('\\<CR>')", "Accept Copilot suggestion", true, true)
                        vim.g.copilot_no_tab_map = true
                end
        }
}
