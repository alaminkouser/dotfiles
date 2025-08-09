vim.api.nvim_create_user_command("Diff", function(opts)
  local arg = opts.args
  if arg == "words" then
    vim.cmd("Gitsigns toggle_word_diff = true")
  elseif arg == "lines" then
    vim.cmd("Gitsigns toggle_linehl = true")
  else
    vim.cmd("Gitsigns toggle_word_diff = false")
    vim.cmd("Gitsigns toggle_linehl = false")
  end
end, {
  nargs = 1,
  complete = function()
    return { "off", "words", "lines" }
  end,
})
