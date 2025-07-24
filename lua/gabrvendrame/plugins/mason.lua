return {
        {
                "mason-org/mason.nvim",
                opts = {},
        },

        {
                "mason-org/mason-lspconfig.nvim",
                dependencies = {
                        { "neovim/nvim-lspconfig" },
                        { "mason-org/mason.nvim" },
                },
                opts = {
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
                }
        },

        {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                opts = function()
                        local utils = require("gabrvendrame.utils.tables")
                        local mason_tool_installer = require("mason-tool-installer")

                        local servers = utils.get_servers()
                        local formatters = utils.get_formatters()
                        local linters = utils.get_linters()

                        local ensure_installed = vim.tbl_keys(servers)

                        vim.list_extend(ensure_installed, formatters)
                        vim.list_extend(ensure_installed, linters)

                        mason_tool_installer.setup({ ensure_installed = ensure_installed })
                end
        },
}
