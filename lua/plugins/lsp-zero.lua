return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	lazy = true,
	config = false,
	init = function()
		-- Disable automatic setup, we are doing it manually
		vim.g.lsp_zero_extend_cmp = 0
		vim.g.lsp_zero_extend_lspconfig = 0

		-- This is here so that noice.nvim works correctly
		-- https://github.com/VonHeikemen/lsp-zero.nvim/issues/320
		vim.g.lsp_zero_ui_float_border = 0
	end,
}
