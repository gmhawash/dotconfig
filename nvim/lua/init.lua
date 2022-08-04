-- keep first in case others depend on the theme
require("config/onedark")
--

require("auto-commands")
require("options")
require("plugins")

require("config/autosave")
require("config/format")
require("config/lua-line")
require("config/nvim-tree")
require("config/telescope")
require("config/treesitter")

require("config/lsp")
require("config/lsp-installer")

require("config/autocomplete")
require("keymaps")
