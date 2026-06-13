vim.lsp.config("gopls", {
  settings = {
    gopls = {
      semanticTokens = false
    }
  }
})

vim.lsp.enable("gopls")
