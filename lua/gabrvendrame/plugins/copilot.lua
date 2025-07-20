return {
        {
                "github/copilot.vim",
                config = function()
                        local function remap(mode, lhs, rhs, desc)
                                vim.keymap.set(mode, lhs, rhs, { desc = desc or nil })
                        end
                        remap("n", "<leader>cst", "<cmd>Copilot status<cr>", "Copilot status")
                        remap("n", "<leader>con", "<cmd>Copilot enable<cr>", "Turn on copilot")
                        remap("n", "<leader>cof", "<cmd>Copilot disable<cr>", "Turn off copilot")
                end
        }
}
