return {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {},
        cmd = "Trouble",
        keys = {
                { "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
                { "[t",        "<cmd>Trouble next<cmd>",              desc = "Next diagnostic" },
                { "]t",        "<cmd>Trouble previous<cmd>",          desc = "Prev diagnostic" }
        }
}
