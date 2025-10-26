vim.defer_fn(function()
  vim.fn.has("clipboard")
  vim.opt.clipboard = "unnamedplus"
end, 1000)
