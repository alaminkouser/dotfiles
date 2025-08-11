require("gitsigns").setup({
  signs = {
    add = { text = " " },
    change = { text = " " },
    delete = { text = " " },
    topdelete = { text = " " },
    changedelete = { text = "󰜥 " },
    untracked = { text = " " },
  },
  signs_staged = {
    add = { text = " " },
    change = { text = " " },
    delete = { text = " " },
    topdelete = { text = " " },
    changedelete = { text = "󰜥 " },
    untracked = { text = " " },
  },
  attach_to_untracked = true,
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
