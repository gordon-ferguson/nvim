-- lazy.nvim spec
local M = {
  "nvim-neorg/neorg",
  version = "7.0.0",
  ft = "norg",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
    "nvim-lua/plenary.nvim",
    "nvim-neorg/neorg-telescope",
  },
  -- build = ":Neorg sync-parsers",
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
  ["core.integrations.telescope"] = {},
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
  ["core.keybinds"] = {
    -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
    config = {
      default_keybinds = true,
      neorg_leader = "<LocalLeader>n",
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
