vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.wo.relativenumber = true
vim.opt.cmdheight=0
vim.opt.mouse = ""
vim.cmd [[let &stc="%=%{v:relnum?v:relnum:v:lnum} "]]
vim.cmd [[set colorcolumn=80]]
vim.cmd [[set cmdheight=0]]
vim.cmd [[set whichwrap+=<,>]]
vim.cmd [[set nowrap]]
vim.cmd [[set signcolumn=no]]
vim.cmd [[aunmenu PopUp.-1-]]
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
