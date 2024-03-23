-- Local variables
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- General keymaps
keymap.set("n", "<C-a>", "ggVG")                                                       -- Select all in normal mode
keymap.set("n", "<BS>", "<C-^>", { silent = true, desc = "Switch to last buffer" })
keymap.set("n", "<Esc>", "<Cmd>noh<CR>", opts)                                         -- Hit escape to remove highlights
keymap.set("n", "<LocalLeader>l", "<Cmd>Lazy<CR>", { silent = true, desc = "Lazy" })   -- Lazy Menu
keymap.set("n", "<LocalLeader>m", "<Cmd>Mason<CR>", { silent = true, desc = "Mason" }) -- Mason Menu

-- J and K key
keymap.set("n", "j", "gj", opts)
keymap.set("n", "k", "gk", opts)

-- Rehighlight selection after indenting
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Replace word under cursor throughout file
keymap.set("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Change c key to that it doesn"t copy into register
keymap.set("n", "c", '"_c', opts)
keymap.set("n", "C", '"_C', opts)

-- Copy/Paste Binds
keymap.set("n", "<Leader>y", "<Cmd>%y+<CR>", { desc = "Yank buffer contents to system clipboard" })
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over visual selection" })

-- Remove need to tap shift to get to command mode
keymap.set("n", ";", ":")

-- Quality of life adjustments for smoother movements
keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll page down and center cursor
keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll page up and center cursor
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "n", "nzzzv")
keymap.set({ "n", "x", "o" }, "H", "^")
keymap.set({ "n", "x", "o" }, "L", "$")

-- Change current working directory locally and print cwd after that
keymap.set("n", "<Leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "change cwd" })

-- Neorg binds
keymap.set("n", "<LocalLeader>nc", "<Cmd>Neorg toc<CR>", { silent = true, desc = "Neorg Table of Contents" })
keymap.set("n", "<LocalLeader>ni", "<Cmd>Neorg index<CR>", { silent = true, desc = "Default Index" })
keymap.set("n", "<LocalLeader>nj", "<Cmd>Neorg journal<CR>", { silent = true, desc = "Journal" })
keymap.set("n", "<LocalLeader>nr", "<Cmd>Neorg return<CR>", { silent = true, desc = "Neorg Return" })
keymap.set("n", "<LocalLeader>nwp", "<Cmd>Neorg workspace Personal<CR>", { silent = true, desc = "Personal Neorg" })
keymap.set("n", "<LocalLeader>nww", "<Cmd>Neorg workspace Work<CR>", { silent = true, desc = "Work Neorg" })
keymap.set("n", "<LocalLeader>nt", "<Cmd>Neorg todo<CR>", { silent = true, desc = "Neorg Todo" })
keymap.set("n", "<LocalLeader>ntd", "core.qol.todo_items.todo.task_done", { silent = true, desc = "Neorg Todo Done" })
keymap.set("n", "<LocalLeader>ntu", "core.qol.todo_items.todo.task_undone", { silent = true, desc = "Neorg Todo Undone" })
keymap.set("n", "<LocalLeader>ntp", "core.qol.todo_items.todo.task_pending", { silent = true, desc = "Neorg Todo Pending" })
keymap.set("n", "<LocalLeader>nth", "core.qol.todo_items.todo.task_on_hold", { silent = true, desc = "Neorg Todo On Hold" })
keymap.set("n", "<LocalLeader>ntc", "core.qol.todo_items.todo.task_cancelled", { silent = true, desc = "Neorg Todo Cancelled" })
keymap.set("n", "<LocalLeader>ntr", "core.qol.todo_items.todo.task_recurring", { silent = true, desc = "Neorg Todo Recurring" })
keymap.set("n", "<LocalLeader>nti", "core.qol.todo_items.todo.task_important", { silent = true, desc = "Neorg Todo Important" })

local neorg_callbacks = require("neorg.core.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)

-- Lazygit
keymap.set("n", "<LocalLeader>g", "<Cmd>LazyGit<CR>", { silent = true, desc = "LazyGit" })

-- Oil
keymap.set("n", "<LocalLeader><LocalLeader>", "<Cmd>Oil<CR>", { silent = true, desc = "Oil" })
keymap.set("n", "<LocalLeader>o", "<CMD>lua require('oil').open_float()<CR>", { desc = "Open Oil in float mode" })

-- Telescope
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

-- See `:help telescope.builtin`
keymap.set("n", "<Leader>?", "<Cmd>Telescope oldfiles<CR>", { desc = "[?] Find recently opened files" })
keymap.set("n", "<Leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap.set("n", "<Leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "[/] Fuzzily search in current buffer" })

keymap.set("n", "<Leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
keymap.set("n", "<Leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap.set("n", "<Leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap.set("n", "<Leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap.set("n", "<Leader>sk", require("telescope.builtin").keymaps, { desc = "[S]earch [K]eymaps" })
keymap.set("n", "<Leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap.set("n", "<Leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
-- keymap.set("n", "<Leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
keymap.set("n", "<Leader>sr", require("telescope.builtin").registers, { desc = "[S]earch [R]egisters" })

-- Undotree
keymap.set("n", "<LocalLeader>u", "<Cmd>UndotreeToggle<CR>", opts)

