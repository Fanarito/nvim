local pickerOpts = { layout = { preset = "vscode", preview = "main" } }

---@module 'snacks'

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {
			-- your picker configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			ui_select = true,
		},
	},

	keys = {
		-- files, buffers, etc...
		{ "<leader><space>", function() Snacks.picker.smart() end,                           desc = "Smart Find Files" },
		{
			"<leader>/",
			function()
				Snacks.picker.grep({
					cmd = "rg",
				})
			end,
			desc = "Grep"
		},
		{ "<leader>,",       function() Snacks.picker.buffers() end,                         desc = "Buffers" },
		{ "<leader>e",       function() Snacks.explorer() end,                               desc = "File Explorer" },

		-- git
		{ "<leader>gl",      function() Snacks.picker.git_log() end,                         desc = "Git Log" },
		{ "<leader>gL",      function() Snacks.picker.git_log_line() end,                    desc = "Git Log Line" },
		{ "<leader>gg",      function() Snacks.picker.git_status() end,                      desc = "Git Status" },

		-- lsp
		{ "gdd",             function() Snacks.picker.lsp_definitions(pickerOpts) end,       desc = "Goto Definition" },
		{ "gde",             function() Snacks.picker.lsp_declarations(pickerOpts) end,      desc = "Goto Declaration" },
		{ "gdr",             function() Snacks.picker.lsp_references(pickerOpts) end,        nowait = true,                  desc = "References" },
		{ "gdi",             function() Snacks.picker.lsp_implementations(pickerOpts) end,   desc = "Goto Implementation" },
		{ "gdt",             function() Snacks.picker.lsp_type_definitions(pickerOpts) end,  desc = "Goto T[y]pe Definition" },
		{ "<leader>ss",      function() Snacks.picker.lsp_symbols(pickerOpts) end,           desc = "LSP Symbols" },
		{ "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols(pickerOpts) end, desc = "LSP Workspace Symbols" },
	},

	cond = not vim.g.vscode,
}
