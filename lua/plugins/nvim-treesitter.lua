-- Highlighting and more
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"go",
				"javascript",
				"typescript",
				"toml",
				"json",
				"markdown",
				"markdown_inline",
				"regex",
				"yaml",
				"tsx",
				"graphql",
				"bash",
				"vim",
			},
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<CR>',
					scope_incremental = false,
					node_incremental = '<CR>',
					node_decremental = '<BS>',
				},
			},

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
		})
	end,
}
