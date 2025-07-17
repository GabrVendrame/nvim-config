return {
        {
                "jiaoshijie/undotree",
                dependencies = {
                        { "nvim-lua/plenary.nvim" },
                },
                config = true,
                -- TODO:: figure it out how to add a description to that
                keys = {
                        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
                },
        }
}
