require("render-markdown").setup({
  render_modes = true,
  latex = {
    enabled = false,
  },
  completions = {
    lsp = { enabled = true },
    blink = { enabled = true },
  },
  heading = {
    icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
    width = "block",
    style = "full",
  },
  dash = {
    width = 80,
  },
  html = {
    enabled = false,
  },
})
