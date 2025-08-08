require("neorg").setup({
  load = {
    ["core.autocommands"] = {},
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          neorg = "~/FILES/neorg",
        },
        default_workspace = "neorg",
        index = "index.norg",
        open_last_workspace = true,
        use_popup = false,
      },
    },
    ["core.integrations.treesitter"] = {},
    ["core.esupports.metagen"] = {
      config = {
        author = "AL AMIN KOUSER",
        timezone = "utc",
      },
    },
  },
})
