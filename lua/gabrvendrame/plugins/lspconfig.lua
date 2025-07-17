return {
        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        {
                                "mason-org/mason.nvim",
                                opts = {},
                        },
                        { "mason-org/mason-lspconfig.nvim" },
                        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
                        { "saghen/blink.cmp" },
                },
                config = function()
                        vim.api.nvim_create_autocmd("LspAttach", {
                                group = vim.api.nvim_create_augroup("lsp-attach", {
                                        clear = true,
                                }),
                                callback = function(event)
                                        local buf = event.buf
                                        local opts = { buffer = buf, remap = false }

                                        -- TODO: replace opts in all set functions for this function:
                                        -- local function opts(description)
                                        --      return { buffer = buf, remap = false, desc = description }
                                        -- end
                                        -- AND with it adds description for each remap to better use
                                        -- of whick-key plugin

                                        vim.keymap.set("n", "gd", function()
                                                vim.lsp.buf.definition()
                                        end, opts)
                                        vim.keymap.set("n", "K", function()
                                                vim.lsp.buf.hover()
                                        end, opts)
                                        vim.keymap.set("n", "<leader>vws", function()
                                                vim.lsp.buf.workspace_symbol()
                                        end, opts)
                                        vim.keymap.set("n", "<leader>vd", function()
                                                vim.diagnostic.open_float()
                                        end, opts)
                                        -- old vim.diagnostic.goto_next, currently deprecated
                                        vim.keymap.set("n", "[d", function()
                                                vim.diagnostic.jump({ count = 1, float = true })
                                        end, opts)
                                        -- old vim.diagnostic.goto_prev, currently deprecated
                                        vim.keymap.set("n", "]d", function()
                                                vim.diagnostic.jump({ count = -1, float = true })
                                        end, opts)
                                        vim.keymap.set("n", "<leader>vca", function()
                                                vim.lsp.buf.code_action()
                                        end, opts)
                                        vim.keymap.set("n", "<leader>vrr", function()
                                                vim.lsp.buf.references()
                                        end, opts)
                                        vim.keymap.set("n", "<leader>vrn", function()
                                                vim.lsp.buf.rename()
                                        end, opts)
                                        vim.keymap.set("n", "<C-h>", function()
                                                vim.lsp.buf.signature_help()
                                        end, opts)

                                        local function client_supports_method(client, method, bufnr)
                                                if vim.fn.has("nvim-0.11") == 1 then
                                                        return client:supports_method(method, bufnr)
                                                else
                                                        return client.supports_method(method, { bufnr = bufnr })
                                                end
                                        end

                                        local client = vim.lsp.get_client_by_id(event.data.client_id)
                                        local supports_highlight_method = client_supports_method(
                                                client,
                                                vim.lsp.protocol.Methods.textDocument_documentHighlight,
                                                event.buf
                                        )
                                        if client and supports_highlight_method then
                                                local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight",
                                                        { clear = false })
                                                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                                                        buffer = event.buf,
                                                        group = highlight_augroup,
                                                        callback = vim.lsp.buf.document_highlight,
                                                })

                                                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                                                        buffer = event.buf,
                                                        group = highlight_augroup,
                                                        callback = vim.lsp.buf.document_highlight,
                                                })

                                                vim.api.nvim_create_autocmd("LspDetach", {
                                                        group = vim.api.nvim_create_augroup("lsp-detach",
                                                                { clear = true }),
                                                        callback = function(event2)
                                                                vim.lsp.buf.clear_references()
                                                                vim.api.nvim_clear_autocmds({
                                                                        group = "lsp-highlight",
                                                                        buffer =
                                                                            event2.buf
                                                                })
                                                        end,
                                                })
                                        end

                                        local supports_inlay_hint_method =
                                            client_supports_method(client,
                                                    vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
                                        if client and supports_inlay_hint_method then
                                                vim.keymap.set("n", "<leader>th", function()
                                                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
                                                                bufnr =
                                                                    event.buf
                                                        }))
                                                end)
                                        end
                                end,
                        })

                        vim.diagnostic.config({
                                severity_sort = true,
                                float = { border = "rounded", source = "if_many" },
                                underline = { severity = vim.diagnostic.severity.ERROR },
                                signs = vim.g.have_nerd_font and {
                                        text = {
                                                [vim.diagnostic.severity.ERROR] = "❌",
                                                [vim.diagnostic.severity.WARN] = "🚨",
                                                [vim.diagnostic.severity.INFO] = "ℹ️",
                                                [vim.diagnostic.severity.HINT] = "💡",
                                        },
                                } or {},
                                virtual_text = {
                                        source = "if_many",
                                        spacing = 2,
                                        format = function(diagnostic)
                                                local diagnostic_message = {
                                                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                                                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                                                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                                                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                                                }

                                                return diagnostic_message[diagnostic.severity]
                                        end,
                                },
                        })

                        local capabilities = require("blink-cmp").get_lsp_capabilities()
                        local servers = {
                                ts_ls = {},
                                eslint = {},
                                lua_ls = {
                                        settings = {
                                                Lua = {
                                                        completion = {
                                                                callSnippet = "Replace",
                                                        },
                                                        diagnostics = {
                                                                globals = {
                                                                        "vim",
                                                                        "require",
                                                                },
                                                        },
                                                },
                                        },
                                },
                                gopls = {},
                                golangci_lint_ls = {},
                                jsonls = {},
                        }

                        local ensure_installed = vim.tbl_keys(servers or {})
                        vim.list_extend(ensure_installed, {
                                "stylua",
                        })

                        require("mason-tool-installer").setup({
                                ensure_installed = ensure_installed
                        })

                        require("mason-lspconfig").setup({
                                ensure_installed = {},
                                automatic_install = false,
                                handlers = {
                                        function(server_name)
                                                local server = servers[server_name] or {}
                                                server.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
                                                        server.capabilities or {})
                                                require("lspconfig")[server_name].setup(server)
                                        end,
                                },
                        })
                end,
        }
}
