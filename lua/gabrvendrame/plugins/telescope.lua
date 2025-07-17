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
                        })

                        -- TODO: add description for each remap to better use of which-key plugin
                        local builtin = require("telescope.builtin")
                        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
                        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
                        vim.keymap.set("n", "<leader>ps", function()
                                builtin.grep_string({ search = vim.fn.input("Grep > ") })
                        end)

                        extensions = {
                                ['ui-select'] = {
                                        require("telescope.themes").get_dropdown(),
                                },
                        }

                        pcall(require("telescope").load_extension("fzf"))
                        pcall(require("telescope").load_extension("ui-select"))
                end,
        }
}
