vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
require("config.lspconfig").setup()
require("nvim-treesitter").install(require("config.plugins.treesitter").ensure_installed):wait(300000)

vim.cmd.colorscheme("onedark")
require("config.colorscheme")
