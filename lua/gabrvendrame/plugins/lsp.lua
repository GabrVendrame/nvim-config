return {
        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        require("gabrvendrame.plugins.mason"),
                        require("gabrvendrame.plugins.blink"),
                },
                config = function()
                        local lsp_utils = require("gabrvendrame.utils.lsp")
                        local lsp_maps = require("gabrvendrame.utils.lsp-map")

                        vim.api.nvim_create_autocmd("LspAttach", {
                                group = vim.api.nvim_create_augroup("lsp-attach", {
                                        clear = true,
                                }),
                                callback = function(event)
                                        local buf = event.buf
                                        local client = vim.lsp.get_client_by_id(event.data.client_id)

                                        lsp_maps.set_keymaps(buf)

                                        lsp_utils.setup_highlight(client, event.buf)

                                        lsp_utils.setup_inlay_hints(client, event.buf)
                                end,
                        })

                        lsp_utils.setup_diagnostics()
                end,
        }
}
