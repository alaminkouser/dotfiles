vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    if vim.bo[args.buf].filetype ~= "text" and vim.bo[args.buf].filetype ~= "" then
      pcall(vim.treesitter.start)
    end
  end,
})
