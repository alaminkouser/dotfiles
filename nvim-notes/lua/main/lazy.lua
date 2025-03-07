local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    dependencies = {
	  "hrsh7th/cmp-nvim-lsp",
	  "hrsh7th/cmp-buffer",
	  "hrsh7th/cmp-path",
	  "hrsh7th/cmp-cmdline",
	  "hrsh7th/nvim-cmp"
	}
  },
  {
    "artempyanykh/marksman"
  },
  {
    "MeanderingProgrammer/render-markdown.nvim"
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "prichrd/netrw.nvim"
  }
})

