local state = { lsp_msg = "" }
local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥", "" }
local stbufnr = function()
	return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

local lsp = function()
	local lsp_msg = ""
	local lsp_progress = state.lsp_msg
	if rawget(vim, "lsp") then
		for _, client in ipairs(vim.lsp.get_clients()) do
			if client.attached_buffers[stbufnr()] then
				lsp_msg = (vim.o.columns > 100 and " 󰅩 " .. client.name .. " ") or " 󰅩 "
			end
		end
	end
	if lsp_progress ~= "" then
		return lsp_progress .. lsp_msg
	end
	return lsp_msg
end

vim.api.nvim_create_autocmd("LspProgress", {
	pattern = { "begin", "report", "end" },
	callback = function(args)
		if not args.data or not args.data.params then
			return
		end
		local data = args.data.params.value
		local progress = ""
		if data.percentage then
			local idx = math.max(1, math.floor(data.percentage / 10))
			local icon = spinners[idx]
			progress = icon .. " " .. data.percentage .. "%% "
		end
		local loaded_count = data.message and string.match(data.message, "^(%d+/%d+)") or ""
		local str = progress .. (data.title or "") .. " " .. (loaded_count or "")
		state.lsp_msg = data.kind == "end" and "" or str
		vim.cmd.redrawstatus()
	end,
})

local git = function()
	if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
		return ""
	end
	local git_status = vim.b[stbufnr()].gitsigns_status_dict
	local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
	local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
	local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
	local branch_name = " " .. git_status.head
	return " " .. branch_name .. added .. changed .. removed
end

return require("lualine").setup({
	options = {
		globalstatus = true,
		incons_enabled = true,
		ignore_focus = { "NvimTree" },
		theme = "auto",
		section_separators = "",
		component_separators = "",
	},
	sections = {
		lualine_x = {
			--{ lsp_msg },
			{ lsp },
			"filetype",
		},
		lualine_b = {
			git,
		},
	},
})
