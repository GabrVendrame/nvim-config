return {
        "neovim/nvim-lspconfig",
        dependencies = {
                "mason-org/mason.nvim",
                "mason-org/mason-lspconfig.nvim",
                "saghen/blink.cmp",
        },
        config = function()
                local utils = require("gabrvendrame.utils")
                local mason_lspconfig = require("mason-lspconfig")
                local ensure_installed = utils.get_ensure_installed()

                mason_lspconfig.setup({
                        ensure_installed = ensure_installed,
                })

                utils.setup_diagnostics()
        end,
}
