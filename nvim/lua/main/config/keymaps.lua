vim.keymap.set("n", "<Esc>", function()
  vim.cmd("Yazi")
end, {
  desc = "Open Yazi",
})

vim.keymap.set("n", "q", function()
  vim.cmd("wqa")
end, {
  desc = "Save All Files and Quit Neovim",
})

vim.keymap.set("n", "r", function()
  vim.api.nvim_feedkeys("q", "n", false)
  vim.defer_fn(function()
    local reg = vim.fn.reg_recording()
    if reg ~= "" then
      vim.notify("recording @" .. reg, vim.log.levels.INFO, {
        render = "simple",
        title = "Recording",
      })
    end
  end, 100)
end)
