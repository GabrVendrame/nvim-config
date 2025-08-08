local L = {}

function L.set_keymaps(bufnr)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", buffer = bufnr })
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol", buffer = bufnr })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Show diagnostics", buffer = bufnr })
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
                { desc = "Next diagnostic", buffer = bufnr })
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
                { desc = "Previous diagnostic", buffer = bufnr })
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { desc = "Find references", buffer = bufnr })
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
        vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = bufnr })
end

return L
