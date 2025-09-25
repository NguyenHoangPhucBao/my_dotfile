return require("mason-lspconfig").setup({
	automatic_enable = false,
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"biome",
	},
})
