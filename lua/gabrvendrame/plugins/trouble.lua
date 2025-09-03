return {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {},
        cmd = "Trouble",
        keys = {
                { "<leader>t", "<cmd>Trouble diagnostics toggle<cr>",   desc = "Diagnostics (Trouble)" },
                { "[t",        "<cmd>Trouble diagnostics next<cr>",     desc = "Next diagnostic (Trouble)" },
                { "]t",        "<cmd>Trouble diagnostics previous<cr>", desc = "Prev diagnostic (Trouble)" }
        }
}
