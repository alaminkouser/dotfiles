local function lualine_diagnostic_message()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = line })
  if #diagnostics > 0 then
    return " " .. diagnostics[1].message:gsub("\n", " ")
  end
  return ""
end

require("lualine").setup({
  sections = {
    lualine_c = { "filename", lualine_diagnostic_message },
  },
})
