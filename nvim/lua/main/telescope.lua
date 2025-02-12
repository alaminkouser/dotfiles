require("telescope").setup{}

vim.cmd [[
  command! -nargs=* F lua require('telescope.builtin').find_files()
]]

