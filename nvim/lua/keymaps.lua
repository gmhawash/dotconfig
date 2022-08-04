-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Paste over selected text
keymap("v", "p", '"_dP', opts)

-- Format with formatter plugin
keymap("n", "<leader>fo", "<cmd>Format<CR>", bufopts)

-- Toggle relative numbering
keymap("n", "<C-n>", "<cmd>set relativenumber!<CR>", opts)

-- Nvim Tree
keymap("n", "<Leader>q<space>", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>ff", "<cmd>NvimTreeFindFile<CR>", opts)

-- Terminal
keymap("n", "<leader>tt", "<cmd>vnew<CR>:terminal<CR>", opts)
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- Maps ctrl-[h,j,k,l] to resizing a window split
keymap("n", "<C-h>", "<C-w><", opts)
keymap("n", "<C-j>", "<C-w>-", opts)
keymap("n", "<C-k>", "<C-w>+", opts)
keymap("n", "<C-l>", "<C-w>>", opts)

-- open Vim configuration file
keymap("n", "<leader>1", ":e ~/.config/nvim/lua/init.lua<CR>", opts)

-- Snippets
keymap("n", "<leader>k", "oconsole.table({})<esc>hi", opts)
keymap("n", "<leader>kl", "oconsole.log(\"<C-r>=expand('%:t:r')<CR>:<C-r>=line('.')<CR>\")<esc>==", opts)
keymap("n", "<leader>l", "oputs<Space>😄#{__FILE__}:#{__LINE__} #{__method__}😄<esc>==", opts)
keymap("n", "<leader>s", "oputs<Space>'🔥'*80<esc>==", opts)
keymap("n", "<leader>ss", "oputs<Space>'🧨'*80<esc>==", opts)
keymap("n", "<leader>p", "obinding.pry<esc>==", opts)
keymap("n", "<leader>F", "yi(A { FactoryBot.create(<esc>pA) }<esc>", opts)

-- Testing
keymap("n", "<leader>ct", ":let @* = 'brspec ' . fnamemodify(expand('%'), ':~:.')<cr>", opts)
keymap("n", "<leader>cr", ":let @* = 'brspec ' . fnamemodify(expand('%') . ':' . line('.'), .:~:..)<cr>", opts)
keymap("n", "<leader>fr", ":let @* = 'rails test ' . fnamemodify(expand('%'), ':~:.:s?backend/??.)<cr>", opts)
keymap(
  "n",
  "<leader>tr",
  ":let @* = 'rails test ' . fnamemodify(expand('%') . ':' . line('.'), .:~:.:s?backend/??')<cr>",
  opts
)

-- Git History
keymap("n", "<leader>gh", ":0Gclog<CR>", opts)
keymap("n", "[q", ":cprev<CR>", opts)
keymap("n", "]q", ":cnext<CR>", opts)

-- F5 trims trailing whitespace
keymap("n", "<F5>", ":%s/\\s\\+$//g<CR>", opts)

-- Switch between last two buffers
keymap("n", "<leader><leader>", "<C-^>", opts)

-- Language Server
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
keymap("n", "<leader>e", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
  keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  keymap("n", "gii", vim.lsp.buf.hover, bufopts)
  keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
  keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  keymap("n", "gr", vim.lsp.buf.references, bufopts)
  keymap("n", "<leader>jf", vim.lsp.buf.formatting, bufopts)
end
