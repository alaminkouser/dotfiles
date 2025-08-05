vim.wo.relativenumber = true
vim.opt.numberwidth = 1
vim.cmd("let &stc=\"%=%{v:relnum?v:relnum:v:lnum} \"")
