return {
	'stevearc/oil.nvim',
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory in oil" },
	},
	cond = not vim.g.vscode,
}
