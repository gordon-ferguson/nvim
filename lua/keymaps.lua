local keymap = vim.keymap

-- Set leader and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- General keymaps
keymap.set('n', '<C-a>', 'ggVG')
keymap.set('n', '<Esc>', '<Cmd>noh<CR>', opts)
keymap.set('n', '<LocalLeader>l', '<Cmd>Lazy<CR>', { silent = true, desc = 'Lazy' })

-- Rehighlight selection after indenting
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-- Replace word under cursor throughout file
keymap.set('n', "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Change c key to that it doesn't copy into register
keymap.set('n', 'c', '"_c', opts)
keymap.set('n', 'C', '"_C', opts)

-- Copy/Paste Binds
keymap.set('n', '<Leader>y', '<Cmd>%y+<CR>', { desc = 'Yank buffer contents to system clipboard' })
keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste over visual selection' })

-- Remove need to tap shift to get to command mode
keymap.set('n', ';', ':')

-- Quality of life adjustments for smoother movements
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', 'N', 'Nzzzv')
keymap.set('n', 'n', 'nzzzv')
keymap.set({ 'n', 'x', 'o' }, 'H', '^')
keymap.set({ 'n', 'x', 'o' }, 'L', '$')
