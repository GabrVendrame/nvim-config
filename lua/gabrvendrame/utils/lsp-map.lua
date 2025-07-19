local LspMap = {}

local function map(mode, lhs, rhs, desc, buf)
        local opts = { buffer = buf, remap = false, desc = desc }
        vim.keymap.set(mode, lhs, rhs, opts)
end

function LspMap.set_keymaps(bufnr)
        map("n", "gd", vim.lsp.buf.definition, "Go to definition", bufnr)
        map("n", "K", vim.lsp.buf.hover, "Hover documentation", bufnr)
        map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace symbol", bufnr)
        map("n", "<leader>vd", vim.diagnostic.open_float, "Show diagnostics", bufnr)
        map("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic", bufnr)
        map("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Previous diagnostic", bufnr)
        map("n", "<leader>vca", vim.lsp.buf.code_action, "Code action", bufnr)
        map("n", "<leader>vrr", vim.lsp.buf.references, "Find references", bufnr)
        map("n", "<leader>vrn", vim.lsp.buf.rename, "Rename symbol", bufnr)
        map("n", "<C-h>", vim.lsp.buf.signature_help, "Signature help", bufnr)
end

return LspMap
