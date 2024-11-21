vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.wo.relativenumber = true
vim.cmd [[set numberwidth=1]]

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.cmd [[set cmdheight=0]]

vim.cmd [[aunmenu PopUp.-1-]]
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]

vim.cmd [[set signcolumn=no]]

vim.cmd [[highlight StatusLine ctermbg=black guibg=black]]
