local lsp_dir = vim.fn.stdpath("config") .. "/lua/main/config/lsp"
for name, _ in vim.fs.dir(lsp_dir) do
  if name:match("%.lua$") then
    local module_name = name:gsub("%.lua$", "")
    require("main.config.lsp." .. module_name)
  end
end
