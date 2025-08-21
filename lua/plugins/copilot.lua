return {
	{
		"zbirenbaum/copilot.lua",

		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = false,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = { enabled = false },
			filetypes = {
				sh = function()
					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
						-- disable for .env files
						return false
					end
					return true
				end,
			},
			-- Set the default copilot model to use
			copilot_model = "claude-3.7-sonnet",
		},
		cond = not vim.g.vscode,
	},
	{
		"olimorris/codecompanion.nvim",
		lazy = false, -- Ensure the plugin is not lazy-loaded
		opts = {
			display = {
				diff = {
					enabled = true,
					-- close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
					-- layout = "vertical", -- vertical|horizontal split for default provider
					-- opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "mini_diff", -- default|mini_diff
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			'echasnovski/mini.diff',
		},
		keys = {
			{
				"<leader>cc",
				"<cmd>CodeCompanionChat Toggle<cr>",
				desc = "Toggle CodeCompanion"
			},
			{
				"ga",
				"<cmd>CodeCompanionChat Add<cr>",
				mode = "v",
				noremap = true,
				silent = true,
			},
			{
				"<leader>ca",
				"<cmd>CodeCompanionActions<cr>",
				noremap = true,
				silent = true,
			},
			{
				"<leader>ct",
				"'<,'>CodeCompanion /tests",
				desc = "Run CodeCompanion on tests",
				mode = "v",
				noremap = true,
				silent = true,
			},
		},
		init = function()
			vim.cmd([[cab cc CodeCompanion]])
		end,
	},
}
