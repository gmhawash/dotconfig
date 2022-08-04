local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['eslint'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['solargraph'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

vim.diagnostic.config({
  underline = true,
  signs = true,
  virtual_text = false,
  float = {
    source = true,
    border = 'rounded',
    focus = false,
  }
})

