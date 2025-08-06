require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delays = 100,
  },
  numhl = true,
})

vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "

vim.opt.wrap = false
