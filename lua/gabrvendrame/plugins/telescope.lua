return {
        {
                "nvim-telescope/telescope.nvim",
                event = "VimEnter",
                dependencies = {
                        { "nvim-lua/plenary.nvim" },
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
                        { "nvim-telescope/telescope-ui-select.nvim" },
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

                        local function remap(mode, lhs, rhs, desc)
                                local opts = {
                                        desc = desc or nil
                                }
                                vim.keymap.set(mode, lhs, rhs, opts)
                        end

                        local builtin = require("telescope.builtin")
                        remap("n", "<leader>pf", builtin.find_files, "Search files")
                        remap("n", "<C-p>", builtin.git_files, "Find git files")
                        remap("n", "<leader>psw", builtin.grep_string, "Search current word")
                        remap("n", "<leader>ps", builtin.live_grep, "Search by grep")

                        remap("n", "<leader>pfvim", function()
                                builtin.find_files { cwd = vim.fn.stdpath "config" }
                        end, "Search in neovim configuration")
                end,
        }
}
