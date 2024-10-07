-- Test running
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
			},
		})
	end,
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			desc = "Run nearest test"

		},
		{
			"<leader>ts",
			"<cmd>Neotest summary<cr>",
			desc = "Test summary"
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ strategy = "dap" })
			end,
			desc = "Debug nearest test"
		},
		{
			"<leader>tb",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run tests in current buffer"
		},
		{
			"<leader>ta",
			function()
				require('neotest').run.run(vim.fn.getcwd())
			end,
			desc = "Run all tests in workspace"
		},
	},
	cond = not vim.g.vscode,
}
