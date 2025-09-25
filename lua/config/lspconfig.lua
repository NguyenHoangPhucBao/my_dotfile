local M = {}

local hover = function()
	vim.lsp.buf.hover({
		border = {
			{ "╭", "C_FloatBorder" },
			{ "─", "C_FloatBorder" },
			{ "╮", "C_FloatBorder" },
			{ "│", "C_FloatBorder" },
			{ "╯", "C_FloatBorder" },
			{ "─", "C_FloatBorder" },
			{ "╰", "C_FloatBorder" },
			{ "│", "C_FloatBorder" },
		},
		close_events = { "CursorMovedI", "BufHidden", "InsertCharPre", "TextChangedI" },
	})
end

function M.setup()
	local lspconfig = require("lspconfig")
	local x = vim.diagnostic.severity
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local on_init = function(client, _)
		if client.supports_method("textDocument/semanticTokens") then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end

	local on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "K", hover, bufopts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<C-wd>", vim.diagnostic.open_float, bufopts)
	end

	local default_config = {
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	}

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

	--	vim.lsp.config("lua_ls", {
	--		on_init = on_init,
	--		on_attach = on_attach,
	--		capabilities = capabilities,
	--		settings = {
	--			Lua = {
	--				runtime = {
	--					version = "LuaJIT",
	--				},
	--				workspace = {
	--					library = vim.api.nvim_get_runtime_file("", true),
	--					checkThirdParty = false,
	--				},
	--				telemetry = {
	--					enable = false,
	--				},
	--			},
	--		},
	--	})

	lspconfig.lua_ls.setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
	lspconfig.ts_ls.setup(default_config)
	lspconfig.prismals.setup(default_config)
end

return M
