-- Code problem listing
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},

	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{ "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,               desc = "Workspace diagnostics" },
		{ "<leader>xb", function() require("trouble").toggle("document_diagnostics") end,                desc = "Buffer/document diagnostics" },
		{ "<leader>xq", function() require("trouble").toggle("quickfix") end,                            desc = "Quickfixes" },
		{ "<leader>xl", function() require("trouble").toggle("loclist") end,                             desc = "Loclist" },

		{ "<leader>xn", function() require("trouble").next({ skip_groups = true, jump = true }) end,     desc = "Next problem" },
		{ "<leader>xp", function() require("trouble").previous({ skip_groups = true, jump = true }) end, desc = "Previousproblem" },

		{ "gR",         function() require("trouble").toggle("lsp_references") end,                      desc = "LSP References??" },
	},

	cond = not vim.g.vscode,
}
