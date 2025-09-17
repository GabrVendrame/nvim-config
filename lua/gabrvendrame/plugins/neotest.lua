return {
        "nvim-neotest/neotest",
        dependencies = {
                "nvim-neotest/nvim-nio",
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
                "nvim-neotest/neotest-jest",
        },
        config = function()
                local jest = require("neotest-jest")

                require("neotest").setup({
                        adapters = {
                                jest
                        },
                })
        end,
        keys = {
                { "<leader>tr", "<cmd>Neotest run<cr>",      desc = "Run nearest test" },
                { "<leader>tf", "<cmd>Neotest run file<cr>", desc = "Runs current file test" },
                { "<leader>to", "<cmd>Neotest output<cr>",   desc = "Opens test output" },
                { "<leader>ts", "<cmd>Neotest summary<cr>",  desc = "Opens test summary" }
        }
}
