local Lsp = {}

local function client_supports_method(client, method, bufnr)
        if vim.fn.has("nvim-0.11") == 1 then
                return client:supports_method(method, bufnr)
        else
                return client.supports_method(method, { bufnr = bufnr })
        end
end

function Lsp.setup_highlight(client, bufnr)
        local method = vim.lsp.protocol.Methods.textDocument_documentHighlight

        local is_supported = client_supports_method(client, method, bufnr)
        if not is_supported then
                return
        end

        local group = vim.api.nvim_create_augroup("lsp-hi", { clear = false })

        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                group = group,
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                group = group,
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references
        })

        vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event)
                        vim.api.nvim_clear_autocmds({ group = "lsp-hi", buffer = event.buf })
                        vim.lsp.buf.clear_references()
                end
        })
end

function Lsp.setup_inlay_hints(client, bufnr)
        local method = vim.lsp.protocol.Methods.textDocument_inlayHint

        local is_supported = client and client_supports_method(client, method, bufnr)
        if not is_supported then
                return
        end

        vim.keymap.set("n", "<leader>th", function()
                        local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
                        vim.lsp.inlay_hint.enable(not is_enabled)
                end,
                { buffer = bufnr, desc = "Toggle Inlay Hints" }
        )
end

function Lsp.setup_diagnostics()
        vim.diagnostic.config({
                severity_sort = true,
                float = {
                        border = "rounded",
                        source = "if_many",
                },
                underline = {
                        severity = vim.diagnostic.severity.ERROR,
                },
                signs = vim.g.have_nerd_font and {
                        text = {
                                [vim.diagnostic.severity.ERROR] = "❌",
                                [vim.diagnostic.severity.WARN] = "⚠️",
                                [vim.diagnostic.severity.INFO] = "ℹ️",
                                [vim.diagnostic.severity.HINT] = "💡",
                        },
                } or {},
                virtual_text = {
                        source = "if_many",
                        spacing = 2,
                        format = function(diagnostic)
                                return diagnostic.message
                        end,
                }
        })
end

return Lsp
