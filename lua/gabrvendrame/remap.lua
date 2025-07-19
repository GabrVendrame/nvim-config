vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

local function remap(mode, lhs, rhs, desc, silent)
        desc = desc or ""
        silent = silent or false
        vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = silent })
end

remap("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlight")

remap("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to location list")

remap("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

remap("n", "<leader>pv", vim.cmd.Ex, "Open file explorer")

-- INFO: uncomment if you not use a movement plugin,
-- my config uses mini.move plugin, turning this map unnecessary
--
-- remap("v", "J", ":m '>+1<CR>gv=gv", "Move selected line down")
-- remap("v", "K", ":m '<-2<CR>gv=gv", "Move selected line up")

remap("n", "J", "mzJ`z", "Join line below (keep cursor)")

remap("n", "<C-d>", "<C-d>zz", "Scroll down (centered)")
remap("n", "<C-u>", "<C-u>zz", "Scroll up (centered)")

remap("n", "n", "nzzzv", "Next search result (centered)")
remap("n", "N", "Nzzzv", "Previous search result (centered)")

remap("x", "<leader>p", [["_dp]], "Paste over (keep register)")

remap({ "n", "v" }, "<leader>y", [["+y]], "Yank (copy) to system clipboard")
remap("n", "<leader>Y", [["+Y]], "Yank (copy) line to system clipboard")

remap({ "n", "v" }, "<leader>d", [["_d]], "Delete to void")

-- INFO: this map came directly from the ThePrimeagen configuration in this video:
-- https://youtu.be/w7i4amO_zaE
--
-- WARN: This is going to get me cancelled
-- remap("i", "<C-c>", "<Esc>", "Quit nvim")
--

remap("n", "Q", "<nop>", "Disable Q")

-- INFO: i'm not using tmux, don't know what this do
-- remap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Open tmux sessionizer")

remap("n", "<leader>f", vim.lsp.buf.format, "Format buffer")

remap("n", "<C-k>", "<cmd>cnext<CR>zz", "Quickfix next")
remap("n", "<C-j>", "<cmd>cprev<CR>zz", "Quickfix previous")
remap("n", "<leader>k", "<cmd>lnext<CR>zz", "Location list next")
remap("n", "<leader>j", "<cmd>lprev<CR>zz", "Location list previous")

remap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and replace word under cursor")
remap("n", "<leader>x", "<cmd>!chmod +x %<CR>", "Make file executable", true)

-- INFO: only useful if proggraming in go
-- remap("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", "Insert go error check")

remap("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/gabrvendrame/lazy.lua<CR>", "Edit lazy config")

remap("n", "<leader>vim", function()
        local myvimrc = vim.fn.expand("$MYVIMRC")
        local dirname = vim.fn.fnamemodify(myvimrc, ":h")

        vim.cmd("Ex " .. dirname)
end, "Opem nvim config directory")
