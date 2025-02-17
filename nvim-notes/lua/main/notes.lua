vim.api.nvim_create_user_command("New", function()
  if vim.bo.filetype == "netrw" then
    local dir = vim.fn.expand("%:p:h")
    local timestamp = string.format("%04d%02d%02d%02d%02d%02d%03d", os.date("*t").year, os.date("*t").month, os.date("*t").day, os.date("*t").hour, os.date("*t").min, os.date("*t").sec, math.floor((os.clock() % 1) * 1000))
    local filename = dir .. "/" .. timestamp .. ".md"
    vim.cmd("edit " .. filename)
  end
end, {})
