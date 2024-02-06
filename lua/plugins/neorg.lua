-- lazy.nvim spec
local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
    "nvim-lua/plenary.nvim",
  },
  build = ":Neorg sync-parsers",
  cmd = "Neorg",
}
local modules = {
  ["core.defaults"] = {},
  ["core.export"] = {},
  ["core.ui.calendar"] = {},
  ["core.export.markdown"] = { config = { extensions = "all" } },
  ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
  ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
  ["core.integrations.nvim-cmp"] = {},
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = "<Leader>n",
    },
  },
  ["core.dirman"] = {
    config = {
      workspaces = {
        Personal = "~/Documents/Notes/Personal",
        Work = "~/Documents/Notes/Work",
      },
      default_workspace = "Personal",
    }
  },
}
M.opts = {
  load = modules,
}
return M