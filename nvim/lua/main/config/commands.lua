vim.api.nvim_create_user_command("E", function()
  vim.cmd("Yazi")
end, {desc = "Yazi"})
