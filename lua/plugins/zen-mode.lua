-- Lua
return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup {
            window = {
                backdrop = 0.8, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                width = 1,
                options = {
                    signcolumn = "no",      -- disable signcolumn
                    number = false,         -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = false,     -- disable cursorline
                    cursorcolumn = false,   -- disable cursor column
                    foldcolumn = "0",       -- disable fold column
                    list = false,           -- disable whitespace characters
                    -- twilight = { enabled = true },
                },
            },
            plugins = {
                gitsigns = { enabled = false }, -- disables git signs
                tmux = { enabled = false },     -- disables the tmux statusline
                -- this will change the font size on kitty when in zen mode
                kitty = {
                    enabled = true,
                    font = "+4", -- font size increment
                },
            },
            on_open = function()
                vim.cmd("IBLDisable")
            end,
            on_close = function()
                vim.cmd("IBLEnable")
            end,
        }
    end,
}
