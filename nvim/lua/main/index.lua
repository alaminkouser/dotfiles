vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.wo.relativenumber = true
vim.cmd [[set numberwidth=1]]
vim.cmd [[let &stc="%=%{v:relnum?v:relnum:v:lnum} "]]

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.cmd [[set cmdheight=0]]

vim.cmd [[set mouse=a]]
vim.cmd [[aunmenu PopUp.-1-]]
vim.cmd [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.cmd [[aunmenu PopUp.-2-]]

vim.cmd [[set signcolumn=no]]
vim.cmd [[set colorcolumn=80]]

vim.opt.wrap = false
vim.cmd [[
  set whichwrap+=<,>,[,]
]]

vim.opt.guicursor = {
  "i-c-ci:ver25-blinkwait500-blinkon300-blinkoff300"
}

vim.cmd [[
  highlight NormalFloat guibg=#000000
]]

vim.api.nvim_create_user_command("Ex", function()
  vim.cmd("Yazi")
end, {})

vim.api.nvim_create_user_command("Explorer", function()
  vim.cmd("Yazi")
end, {})

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
