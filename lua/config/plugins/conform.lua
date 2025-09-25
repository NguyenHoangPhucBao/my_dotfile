return require("conform").setup{
  formatters_by_ft = {
    lua = {"stylua"},
    typescript = {"biome"},
    javascript = {"biome"},
    typescriptreact = {"biome"},
    javascriptreact = {"biome"},
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
    lsp_fallback = true,
  },
}
