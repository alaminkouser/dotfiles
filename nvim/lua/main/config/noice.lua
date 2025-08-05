require("noice").setup({
  views = {
    notify = {
      replace = true
    }
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true
    },
    progress = {
      enabled = true,
      view = "notify"
    }
  }
})
