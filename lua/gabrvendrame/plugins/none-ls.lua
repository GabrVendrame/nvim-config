return {
        "nvimtools/none-ls.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
                local none_ls = require("null-ls")
                local sources = {
                        none_ls.builtins.diagnostics.mypy,
                        none_ls.builtins.diagnostics.sqruff,
                        none_ls.builtins.formatting.black,
                        none_ls.builtins.formatting.prettier,
                }

                none_ls.setup({
                        sources = sources,
                })
        end
}
