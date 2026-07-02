vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("andrey.core.options")
require("andrey.core.keymaps")
require("andrey.core.autocmds")

-- Built-in colorscheme (Neovim 0.12+): muted, minimal palette
pcall(vim.cmd, "colorscheme habamax")

require("andrey.bootstrap")
