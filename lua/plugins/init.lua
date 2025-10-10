return {
  --NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      return require("config.plugins.nvim-tree")
    end,
  },

  --Theme
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "darker",
      })
    end,
  },

  ---LuaLine (StatusLine)
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      return require("config.plugins.lualine")
    end,
  },

  --GitSigns
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    lazy = false,
    config = function()
      return require("config.plugins.gitsigns")
    end,
  },

  --Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    config = function()
      return require("config.plugins.bufferline")
    end,
  },

  --AutoPair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("config.plugins.autopair")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  --TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    --cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/parsers",
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  --Auto Tag
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      return require("config.plugins.autotag")
    end,
  },

  --Indent Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    event = "User FilePost",
    main = "ibl",
    config = function()
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      return require("config.plugins.ibl")
    end,
  },

  --conform.nvim
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      return require("config.plugins.conform")
    end,
  },

  --mason
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    config = function()
      return require("config.plugins.mason")
    end,
  },

  --Mason lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      return require("config.plugins.mason-lsp")
    end,
  },

  --LSP config
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },

  --Cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = false,
    dependencies = {
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "https://codeberg.org/FelipeLema/cmp-async-path.git",
        lazy = false
      },
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })
          require("config.plugins.snip")
        end,
      },
    },
    config = function()
      return require("config.plugins.cmplt")
    end,
  },

  --NvzoneUI
  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },

  --Telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = false,
          },
        },
      })
    end,
  },

  --Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup()
    end,
  },

  --LspSaga
  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = function()
      require("lspsaga").setup({
        finders = {
          keys = {
            toggle_or_open = "C-f",
          },
        },
      })
    end,
  },

  --Comment.nvim
  {
    "numToStr/Comment.nvim",
    opts = {}
  },

  --ts-error-translator.nvim
  {
    "dmmulroy/ts-error-translator.nvim",
    lazy = false,
    config = function()
      require("ts-error-translator").setup()
    end
  },
}
