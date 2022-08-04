local telescope = require("telescope")
local actions = require("telescope.actions")
local sorters = require("telescope.sorters")

telescope.setup({
  pickers = {
    live_grep = {
      mappings = {
        i = { ["<c-f>"] = actions.to_fuzzy_refine },
      },
    },
    grep_string = {
      mappings = {
        i = { ["<c-f>"] = actions.to_fuzzy_refine },
      },
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        n = {
          ['<c-d>'] = actions.delete_buffer
        },
        i = {
          ["<C-d>"] = actions.delete_buffer
        }
      }
    }
  },
  extensions = {
    live_grep_args = {
      auto_quoting = false,
    }
  },
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    generic_sorter = sorters.get_fzy_sorter,
  },
})
