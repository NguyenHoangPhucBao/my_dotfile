local x = vim.diagnostic.severity

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("biome")

vim.lsp.config('*', {
  on_init = function(client, _)
    if client:supports_method("textDocument/semanticTokens") then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end
})

vim.diagnostic.config({
  virtual_text = { prefix = "" },
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  underline = true,
  float = {
    border = "rounded",
    header = "",
    focusable = false,
    scope = "cursor",
  },
})
