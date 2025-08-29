local pinned_file = nil

vim.lsp.enable("tinymist")
vim.lsp.config["tinymist"] = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  settings = {},
  on_attach = function(client, bufnr)
    if pinned_file == nil then
      pinned_file = vim.api.nvim_buf_get_name(0)
    end
    client:exec_cmd({
      title = "pin",
      command = "tinymist.pinMain",
      arguments = { pinned_file },
    }, { bufnr = bufnr })
  end,
}
