local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- General keymaps
keymap.set('n', '<C-a>', 'ggVG') -- Select all in normal mode
keymap.set('n', '<BS>', '<C-^>', { silent = true, desc = 'Switch to last buffer' })keymap.set('n', '<Esc>', '<Cmd>noh<CR>', opts) -- Hit escape to remove highlights
keymap.set('n', '<LocalLeader>l', '<Cmd>Lazy<CR>', { silent = true, desc = 'Lazy' }) -- Lazy Menu
keymap.set('n', '<LocalLeader>m', '<Cmd>Mason<CR>', { silent = true, desc = 'Lazy' }) -- Mason Menu

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
keymap.set('n', '<C-d>', '<C-d>zz') -- Scroll page down and center cursor
keymap.set('n', '<C-u>', '<C-u>zz') -- Scroll page up and center cursor
keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', 'N', 'Nzzzv')
keymap.set('n', 'n', 'nzzzv')
keymap.set({ 'n', 'x', 'o' }, 'H', '^')
keymap.set({ 'n', 'x', 'o' }, 'L', '$')

-- Change current working directory locally and print cwd after that
keymap.set('n', '<leader>cd', '<cmd>lcd %:p:h<cr><cmd>pwd<cr>', { desc = 'change cwd' })

-- Neorg binds
keymap.set('n', '<Leader>nc', '<Cmd>Neorg toc<CR>', { silent = true, desc = 'Neorg Table of Contents' })
keymap.set('n', '<Leader>ni', '<Cmd>Neorg index<CR>', { silent = true, desc = 'Default Index' })
keymap.set('n', '<Leader>nj', '<Cmd>Neorg journal<CR>', { silent = true, desc = 'Journal' })
keymap.set('n', '<Leader>nr', '<Cmd>Neorg return<CR>', { silent = true, desc = 'Neorg Return' })
keymap.set('n', '<Leader>nwp', '<Cmd>Neorg workspace Personal<CR>', { silent = true, desc = 'Personal Neorg' })
keymap.set('n', '<Leader>nww', '<Cmd>Neorg workspace Work<CR>', { silent = true, desc = 'Work Neorg' })

-- Telescope
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
