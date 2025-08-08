require("neorg").setup({
  load = {
    ["core.autocommands"] = {},
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.completion"] = {
      config = {
        engine = { module_name = "external.lsp-completion" },
      },
    },
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
    ["core.dirman.utils"] = {},
    ["external.interim-ls"] = {
      config = {
        completion_provider = {
          enable = true,
          documentation = true,
          categories = true, -- To-Do: Not Working Now; Completion will be Changed
          people = {
            enable = true,
            path = "people",
          },
        },
      },
    },
  },
})
