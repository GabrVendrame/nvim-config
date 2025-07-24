local function remap(mode, lhs, rhs, desc)
        local opts = {
            desc = desc or nil
        }
        vim.keymap.set(mode, lhs, rhs, opts)
end
return {
        {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
                dependencies = {
                        { "nvim-lua/plenary.nvim" },
                },
                config = function()
                        local harpoon = require("harpoon")
                        harpoon:setup()

                        remap("n", "<leader>a", function() harpoon:list():add() end, "Add file to harpoon")
                        remap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Open harpoon window")

                        remap("n", "<C-h>", function() harpoon:list():select(1) end)
                        remap("n", "<C-t>", function() harpoon:list():select(2) end)
                        remap("n", "<C-n>", function() harpoon:list():select(3) end)
                        remap("n", "<C-s>", function() harpoon:list():select(4) end)

                        remap("n", "<C-S-P>", function() harpoon:list():prev() end)
                        remap("n", "<C-S-N>", function() harpoon:list():next() end)
                end
        }
}
