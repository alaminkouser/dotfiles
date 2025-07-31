vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "●"
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

require("main.lspconfig-list.denols")
require("main.lspconfig-list.marksman")
require("main.lspconfig-list.nushell")

local function show_diagnostics_noice()
  local diagnostics = vim.diagnostic.get()
  if vim.tbl_isempty(diagnostics) then
    require("noice").notify("✅ No Issues", "info", { title = "LSP Diagnostics" })
    return
  end

  for _, diag in ipairs(diagnostics) do
    local bufnr = diag.bufnr or 0
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local lnum = diag.lnum + 1
    local col = diag.col + 1
    local msg = diag.message:gsub("\n", " ")
    local text = string.format("📄 %s:%d:%d - %s", filename, lnum, col, msg)
    require("noice").notify(text, "error", { title = "LSP Diagnostic" })
  end
end

-- Run once at start for all files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.defer_fn(show_diagnostics_noice, 1000)
  end,
})

-- Autocmd: Show diagnostics when they change in markdown files
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.defer_fn(show_diagnostics_noice, 100)
    end
  end,
})