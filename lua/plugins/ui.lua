return {
	{
		'ribru17/bamboo.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('bamboo').setup {
				-- optional configuration here
			}
			require('bamboo').load()
		end,
	},
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				-- config
			}
		end,
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		config = true,
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons' },
		},
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		'nvim-focus/focus.nvim',
		version = '*',
		opts = {
			autoresize = {
				enable = false,
			}
		},
		keys = {
			{
				"<leader>wh",
				"<cmd>FocusSplitLeft<cr>",
				"Go to or create window left",
			},
			{
				"<leader>wj",
				"<cmd>FocusSplitDown<cr>",
				"Go to or create window down",
			},
			{
				"<leader>wk",
				"<cmd>FocusSplitUp<cr>",
				"Go to or create window up",
			},
			{
				"<leader>wl",
				"<cmd>FocusSplitRight<cr>",
				"Go to or create window right",
			},
			{
				"<leader>ws",
				"<cmd>FocusSplitNicely<cr>",
				"Split window nicely",
			},
			{
				"<leader>wm",
				"<cmd>FocusMaximise<cr>",
				"Maximise current window",
			},
			{
				"<leader>w=",
				"<cmd>FocusEqualise<cr>",
				"Equalise splits",
			},
			{
				"<leader>wf",
				"<cmd>FocusToggle<cr>",
				"Toggle focus",
			},
		},
	},
}
