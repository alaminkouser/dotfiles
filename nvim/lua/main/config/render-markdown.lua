require("render-markdown").setup({
  render_modes = true,
  latex = {
    enabled = false,
  },
  completions = {
    lsp = { enabled = false },
  },
  heading = {
    icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
    width = "block",
  },
  dash = {
    width = 80,
  },
  html = {
    enabled = false,
  },
  code = {
    width = "block",
  },
})
