-- Gordon's Init
-- Set leader and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("options")
require("core")
require("keymaps")
require("autocommands")

-- Hyprlang LSP
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
		pattern = {"*.hl", "hypr*.conf"},
		callback = function(event)
				print(string.format("starting hyprls for %s", vim.inspect(event)))
				vim.lsp.start {
						name = "hyprlang",
						cmd = {"hyprls"},
						root_dir = vim.fn.getcwd(),
				}
		end
})
