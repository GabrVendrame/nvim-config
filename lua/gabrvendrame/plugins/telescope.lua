return {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-ui-select.nvim",
                {
                        "nvim-telescope/telescope-fzf-native.nvim",
                        build = "make",
                        cond = function()
                                return vim.fn.executable 'make' == 1
                        end,
                },
                {
                        "nvim-tree/nvim-web-devicons",
                        enabled = vim.g.have_nerd_font
                },
        },
        config = function()
                local telescope = require("telescope")

                telescope.setup({
                        defaults = {
                                mappings = {
                                        i = {
                                                ["<C-h>"] = "which_key",
                                        },
                                },
                        },
                        extensions = {
                                ['ui-select'] = {
                                        require("telescope.themes").get_dropdown({
                                                winblend = 10,
                                                previwer = true,
                                        }),
                                },
                        }
                })

                pcall(require("telescope").load_extension("fzf"))
                pcall(require("telescope").load_extension("ui-select"))

                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search files" })
                vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
                vim.keymap.set("n", "<leader>ps", builtin.grep_string, { desc = "Search current word" })
                vim.keymap.set("n", "<leader>pw", builtin.live_grep, { desc = "Search by grep" })

                vim.keymap.set("n", "<leader>fvim", function()
                        builtin.find_files { cwd = vim.fn.stdpath "config" }
                end, { desc = "Search in neovim configuration" })
        end,
}
