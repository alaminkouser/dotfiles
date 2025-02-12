vim.diagnostic.config({ update_in_insert = true })

require("main.lspconfig-list.zig")
require("main.lspconfig-list.deno")
require("main.lspconfig-list.gopls")
require("main.lspconfig-list.marksman")
-- require("main.lspconfig-list.markdown_oxide")
require("main.lspconfig-list.texlab")
