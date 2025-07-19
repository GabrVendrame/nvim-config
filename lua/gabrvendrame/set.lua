vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.showmode = true

vim.schedule(function()
        vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.smartindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.o.expandtab = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.opt.isfname:append("@-@")

vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when copying text with yank",
        group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
        callback = function()
                vim.hl.on_yank()
        end,
})
