-- Remove intro message
vim.opt.shortmess:append('I')

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Wrap
vim.opt.wrap = false

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Itincremental search
vim.opt.incsearch = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Window Adjustments
vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"

vim.opt.ignorecase = true

vim.opt.inccommand = "split"

-- Save undo history
vim.opt.undofile = true

-- Colors
vim.opt.termguicolors = true

-- Swap
vim.opt.swapfile = false

-- Completion menu transparency
vim.opt.pumblend = 10

-- Folds / Neorg
vim.opt.conceallevel = 1
vim.opt.foldlevelstart = 99 -- Disable folding by default

-- Show pending command in normal mode
vim.opt.showcmd = true
