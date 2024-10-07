return {
	cond = not vim.g.vscode,

	'akinsho/toggleterm.nvim',
	version = "v2.*",
	opts = {
		direction = "float",
		on_open = function(term)
			-- Close terminal with ctrl-\
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"t", "<c-\\>", "<cmd>ToggleTerm<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
	},
}
