-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vim.cmd([[
  augroup packer_config
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

-- Always enter terminal in insert mode
vim.cmd([[
  autocmd BufWinEnter,WinEnter term://* startinsert
]])

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.txt", "*.md" },
  command = "setlocal spell" }
)
