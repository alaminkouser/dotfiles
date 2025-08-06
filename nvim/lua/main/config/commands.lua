vim.api.nvim_create_user_command("E", function()
  vim.cmd("Yazi")
end, { desc = "Yazi" })

vim.api.nvim_create_user_command("Diff", function()
  vim.cmd([[
    Gitsigns toggle_linehl
    Gitsigns toggle_word_diff
  ]])
end, { desc = "Toggle Git Diff" })
