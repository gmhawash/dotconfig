configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "ruby",
    "javascript",
    "lua",
    "css",
    "dockerfile",
    "html",
    "json",
    "markdown",
    "scss",
    "sql",
    "tsx",
    "typescript",
    "yaml",
  }, -- one of "all" or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "css" } },
})
