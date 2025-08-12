return {
        "neovim/nvim-lspconfig",
        dependencies = {
                "mason-org/mason.nvim",
                "mason-org/mason-lspconfig.nvim",
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                require("gabrvendrame.plugins.blink"),
        },
        config = function()
                local utils = require("gabrvendrame.utils")
                local mason = require("mason")
                local mason_lspconfig = require("mason-lspconfig")
                local mason_tool_installer = require("mason-tool-installer")

                mason.setup()

                mason_lspconfig.setup({
                        ensure_installed = {},
                        handlers = {
                                function(server_name)
                                        local servers = require("gabrvendrame.utils.tables").get_servers()
                                        local capabilities = require("blink-cmp").get_lsp_capabilities()
                                        local lspconfig = require("lspconfig")

                                        local server = servers[server_name] or {}
                                        server.capabilities = vim.tbl_deep_extend(
                                                "force",
                                                {},
                                                capabilities,
                                                server.capabilities or {}
                                        )

                                        lspconfig[server_name].setup(server)
                                end,
                        },
                })

                local ensure_installed = utils.get_ensure_installed()

                mason_tool_installer.setup({ ensure_installed = ensure_installed })

                utils.setup_diagnostics()
        end,
}
