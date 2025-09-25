local opt = vim.opt
local o = vim.o
local g = vim.g

--Line Number
o.number = true
o.numberwidth = 2
o.ruler = false

--Mouse & Clipboard
o.mouse = "a"
o.mousemoveevent = true
o.clipboard = "unnamedplus"

--Indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.breakindent = true

--Search
o.smartcase = true
o.ignorecase = true
o.hlsearch = true
o.incsearch = true

--Apperance
opt.fillchars:append({ eob = " " })
opt.shortmess:append("sI")
o.signcolumn = "yes"
o.cursorline = true
o.cursorlineopt = "number"
o.termguicolors = true
o.showmode = false

--Splits
o.splitbelow = true
o.splitright = true

--Others
opt.errorbells = false
opt.swapfile = false
opt.backup = false
o.timeoutlen = 400
o.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
o.updatetime = 100
opt.whichwrap:append("<>[]hl")
opt.completeopt = { "menuone", "noselect" }
opt.inccommand = "split"
opt.laststatus = 3

--File Encoding
o.fileencoding = "utf-8"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
