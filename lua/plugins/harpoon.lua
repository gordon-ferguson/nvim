return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({

            vim.keymap.set("n", "<leader>ha", function()
                harpoon:list():append()
            end, { desc = "Add current file to harpoon" }),
            vim.keymap.set("n", "<leader>hh", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Toggle Harpoon Menu" }),

            vim.keymap.set("n", "<leader>hi", function()
                harpoon:list():select(1)
            end, { desc = "Select first item in harpoon" }),
            vim.keymap.set("n", "<leader>hj", function()
                harpoon:list():select(2)
            end, { desc = "Select second item in harpoon" }),
            vim.keymap.set("n", "<leader>hk", function()
                harpoon:list():select(3)
            end, { desc = "Select third item in harpoon" }),
            vim.keymap.set("n", "<leader>hl", function()
                harpoon:list():select(4)
            end, { desc = "Select fourth item in harpoon" }),
        })
    end,
}
