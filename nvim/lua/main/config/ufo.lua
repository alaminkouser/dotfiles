require("ufo").setup({})

vim.o.foldlevelstart = 100

vim.cmd("set foldmethod=expr foldexpr=v:lua.vim.treesitter.foldexpr()")
