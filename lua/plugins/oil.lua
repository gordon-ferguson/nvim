return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("oil").setup({
            keymaps = {
                ["q"] = "actions.close",
            },
        })
    end
}
