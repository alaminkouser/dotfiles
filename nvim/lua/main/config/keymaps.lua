local function should_save_current_buffer()
  local bufname = vim.api.nvim_buf_get_name(0)
  local modifiable = vim.bo.modifiable
  local readonly = vim.bo.readonly
  return bufname ~= "" and modifiable and not readonly
end

vim.keymap.set("n", "<Esc>", function()
  vim.cmd("Yazi")
end, {
  desc = "Save File (if applicable) and Open Yazi with Esc in Normal Mode",
})

vim.keymap.set("n", "q", function()
  if should_save_current_buffer() then
    vim.cmd("w")
  end
  vim.cmd("q")
end, {
  desc = "Save and Quit Neovim with q",
})
