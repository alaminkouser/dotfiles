vim.api.nvim_create_user_command("Gn", function()
    local file = vim.fn.expand("%:p:h") .. "/" .. os.date("%Y%m%d%H%M%S") .. string.format("%03d", math.floor(vim.fn.localtime() * 1000) % 1000) .. ".md"
    vim.cmd("edit " .. file)
end, {})
