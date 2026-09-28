vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        reportUnusedVariable = "error",
      },
    },
  },
}

vim.lsp.enable("pyright")
