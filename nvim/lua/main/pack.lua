vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("*"),
  },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
  },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/catppuccin/nvim" },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

  -- Auto List
  { src = "https://github.com/gaoDean/autolist.nvim" },

  -- FOLD CODE --
  { src = "https://github.com/kevinhwang91/promise-async" },
  { src = "https://github.com/kevinhwang91/nvim-ufo" },

  -- LUALINE --
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },

  -- YAZI --
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/mikavilpas/yazi.nvim" },

  -- NOICE --
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/rcarriga/nvim-notify" },
  { src = "https://github.com/folke/noice.nvim" },

  -- LSP --
  { src = "https://github.com/luals/lua-language-server" },

  -- Typst Preview ---
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
})
