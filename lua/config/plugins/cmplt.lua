local cmp = require("cmp")
local luasnip = require("luasnip")
local hlcache = {}
local lspkind_icons = {
	Namespace = "󰌗",
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰆧",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󱓻",
	File = "󰈚",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰊄",
	Table = "",
	Object = "󰅩",
	Tag = "",
	Array = "[]",
	Boolean = "",
	Number = "",
	Null = "󰟢",
	Supermaven = "",
	String = "󰉿",
	Calendar = "",
	Watch = "󰥔",
	Package = "",
	Copilot = "",
	Codeium = "",
	TabNine = "",
	BladeNav = "",
}

local lsp = function(entry, item, kind_txt)
	local color = entry.completion_item.documentation
	local icon = "󱓻" .. " "

	if color and type(color) == "string" and color:match("^#%x%x%x%x%x%x$") then
		local hl = "hex-" .. color:sub(2)

		if not hlcache[hl] then
			vim.api.nvim_set_hl(0, hl, { fg = color })
			hlcache[hl] = true
		end

		item.kind = icon .. kind_txt
		item.kind_hl_group = hl
		item.menu_hl_group = hl
	end
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	completion = { completeopt = "menu,menuone" },

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- Tab completion
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 1000 },
		{ name = "luasnip", priority = 750 },
		{ name = "buffer", priority = 500 },
		{ name = "async_path", priority = 250 },
		{ name = "nvim_lsp_signature_help", priority = 200 },
	}),
	formatting = {
		format = function(entry, item)
			local icons = lspkind_icons
			local icon = icons[item.kind] or ""
			local kind = item.kind or ""
			item.menu = kind
			item.menu_hl_group = "CmpItemKind" .. kind
			item.kind = icon
			lsp(entry, item, true)
			return item
		end,
		fields = { "kind", "abbr", "menu" },
	},
	window = {
		completion = {
			border = "rounded",
			scrollbar = false,
			side_padding = 1,
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None,FloatBorder:CmpBorder",
		},
		documentation = {
			border = "rounded",
			scrollbar = false,
			winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
		},
	},
})
