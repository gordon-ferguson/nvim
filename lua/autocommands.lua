return {
    -- Redirect output of vim command to new buffer instead of built-in command output
    vim.api.nvim_create_user_command('Redir', function(ctx)
        local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
        vim.cmd('new')
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
        vim.opt_local.modified = false
    end, { nargs = '+', complete = 'command' }),

    vim.api.nvim_create_autocmd("BufNewFile", {
      pattern = "*.nix",
      callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
      end,
    }),
    
    vim.api.nvim_create_autocmd("BufRead", {
      pattern = "*.nix",
      callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
      end,
    }),
}
