local notify = require("notify")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local buf_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    if buf_name == "" and (#buf_lines == 1 and buf_lines[1] == "") then
      vim.schedule(function()
        vim.cmd("Yazi")
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  callback = function()
    local filename = vim.fn.expand("%:t")
    notify(
      "Filename: " .. filename,
      vim.log.levels.INFO,
      { title = "New File" }
    )
  end,
})
