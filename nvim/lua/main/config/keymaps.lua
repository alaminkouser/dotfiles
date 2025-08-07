local function should_save_current_buffer()
  local bufname = vim.api.nvim_buf_get_name(0)
  local modifiable = vim.bo.modifiable
  local readonly = vim.bo.readonly
  return bufname ~= "" and modifiable and not readonly
end

vim.keymap.set("n", "<Esc>", function()
  vim.cmd("Yazi")
end, {
  desc = "Open Yazi",
})

vim.keymap.set("n", "q", function()
  if should_save_current_buffer() then
    vim.cmd("write ++p")
  end
  vim.cmd("quit")
end, {
  desc = "Save and Quit Neovim",
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
