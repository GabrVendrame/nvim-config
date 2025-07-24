return {
        {
                "github/copilot.vim",
                config = function()
                        local function remap(mode, lhs, rhs, desc, expr, silent)
                                local opts = {
                                        desc = desc or nil,
                                        expr = expr or false,
                                        silent = silent or false,
                                }
                                vim.keymap.set(mode, lhs, rhs, opts)
                        end

                        vim.keymap.set("n", "<leader>cst", "<cmd>Copilot status<cr>", { desc = "Copilot status" })
                        vim.keymap.set("n", "<leader>con", "<cmd>Copilot enable<cr>", { desc = "Turn on copilot" })
                        vim.keymap.set("n", "<leader>cof", "<cmd>Copilot disable<cr>", { desc = "Turn off copilot" })
                        vim.keymap.set("i", "<C-a>", "copilot#Accept('')",
                                { desc = "Accept Copilot suggestion", expr = true, silent = true, replace_keycodes = false })
                        vim.g.copilot_no_tab_map = true
                end
        }
}
