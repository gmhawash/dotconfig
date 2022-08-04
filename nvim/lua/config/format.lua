-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format and FormatWrite commands
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    ruby = {
      require("formatter.filetypes.ruby").rubocop,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettierd,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettierd,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettierd,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettierd,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    -- ["*"] = {
    -- "formatter.filetypes.any" defines default configurations for any
    -- filetype
    -- require("formatter.filetypes.any").remove_trailing_whitespace
    -- }
  },
})
