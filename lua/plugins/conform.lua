return {
	'stevearc/conform.nvim',
	opts = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { { "prettierd", "prettier" } },
		go = { "goimports", "gofmt" },

		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format()
			end,
			desc = "Format",
		},
	},
}
