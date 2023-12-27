-- Highlighting and more
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
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
			},
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<CR>',
					scope_incremental = '<CR>',
					node_incremental = '<TAB>',
					node_decremental = '<S-TAB>',
				},
			},

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
		})
	end
}
