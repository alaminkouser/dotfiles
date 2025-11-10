vim.defer_fn(function()
  if vim.fn.has("clipboard") == 1 then
    vim.keymap.set({"n", "v"}, "y", "\"+y", { noremap = true })
    vim.keymap.set("n", "yy", "\"+yy", { noremap = true })
    vim.keymap.set({"n", "v"}, "p", "\"+p", { noremap = true })
    vim.keymap.set({"n", "v"}, "P", "\"+P", { noremap = true })
  end
end, 1000)
