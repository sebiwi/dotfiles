-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Markdown: 4-space indentation, matching prettier (tabWidth in .prettierrc.yaml)
-- and markdownlint (MD007 indent). guess-indent may still override this per
-- buffer when a file's existing content clearly uses another width.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
