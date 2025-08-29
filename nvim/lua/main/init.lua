vim.g.mapleader = "<Space>"
vim.g.maplocalleader = ","

require("main.pack")

local config_dir = vim.fn.stdpath("config") .. "/lua/main/config"

for name, _ in vim.fs.dir(config_dir) do
  if name:match("%.lua$") then
    local module_name = name:gsub("%.lua$", "")
    require("main.config." .. module_name)
  end
end
