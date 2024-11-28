return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	config = function()
		local teleTrouble = require("trouble.sources.telescope")
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = {
						"rg",
						"--vimgrep",
						"--files",
						"--hidden",
						"--glob=!**/.git/*",
					},
				},
				buffers = {
					show_all_buffers = true,
					sort_mru = true,
					mappings = { i = { ["<c-d>"] = "delete_buffer" } },
				},
			},
			defaults = {
				mappings = {
					i = { ["<c-t>"] = teleTrouble.open },
					n = { ["<c-t>"] = teleTrouble.open },
				},
			},
		})
	end,
	keys = {
		{ "<leader><space>", "<cmd>Telescope find_files<cr>",                    desc = "Find files" },
		{ "<leader>/",       "<cmd>Telescope live_grep<cr>",                     desc = "Search in workspace" },
		{ "<leader>,",       "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
		{
			"<leader>.",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
			end,
			desc = "Find files in cwd",
		},
		{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Search symbols in file" },
		{ "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search symbols in workspace" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Search in buffer" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",                       desc = "Find buffer" },

		-- Telescope git stuff
		{ "<leader>gg", "<cmd>Telescope git_status<cr>",                    desc = "Git status" },

		-- Gotos
		{ "gdt",        "<cmd>Telescope lsp_type_definitions<cr>",          desc = "Go to type" },
		{ "gdd",        "<cmd>Telescope lsp_definitions<cr>",               desc = "Go to definition" },
		{ "gdi",        "<cmd>Telescope lsp_implementations<cr>",           desc = "Go to implementation" },
		{ "gdr",        "<cmd>Telescope lsp_references<cr>",                desc = "Go to reference" },
	},
	cond = not vim.g.vscode,
}
