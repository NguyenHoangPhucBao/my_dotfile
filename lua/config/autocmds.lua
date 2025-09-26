vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("lazy").update({ show = false })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "json",
    "html",
    "css",
    "prisma",
  },
  callback = function()
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.schedule(function()
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client then
        local signatureProvider = client.server_capabilities.signatureHelpProvider
        if signatureProvider and signatureProvider.triggerCharacters then
          require("utils.lsp.signature").setup(client, args.buf)
        end
      end
    end)
  end,
})
