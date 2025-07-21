local set_auto_format_on_save = function(client, bufnr)
        local method = vim.lsp.protocol.Methods.textDocument_formatting
        local is_supported = client.supports_method(method)
        local autoformat_augroup = vim.api.nvim_create_augroup("AutoformatOnSave", {})

        if is_supported then
                vim.api.nvim_clear_autocmds({
                        group = autoformat_augroup,
                        buffer = bufnr
                })
                vim.api.nvim_create_autocmd("BufWritePre", {
                        group = autoformat_augroup,
                        buffer = bufnr,
                        callback = function()
                                vim.lsp.buf.format({ async = false })
                        end
                })
        end
end

return {
        {
                "nvimtools/none-ls.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
                config = function()
                        local none_ls = require("null-ls")
                        local utils = require("gabrvendrame.utils.tables")
                        local sources = utils.get_sources()

                        none_ls.setup({
                                sources = sources,
                                on_attach = function(client, bufnr)
                                        set_auto_format_on_save(client, bufnr)
                                end
                        })
                end
        }
}
