vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.wo.relativenumber = true
-- vim.cmd [[set numberwidth=1]]
-- vim.cmd [[let &stc="%=%{v:relnum?v:relnum:v:lnum} "]]
vim.wo.number = false

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.cmd [[set cmdheight=0]]

vim.cmd [[aunmenu PopUp.-1-]]
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.o.mouse = "nicr"

vim.cmd [[set signcolumn=no]]

