return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = true,
	keys = {
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",      desc = "Git stage hunk" },
		{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Git undo stage hunk" },
		{ "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>",    desc = "Git stage buffer" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",      desc = "Git reset hunk" },
		{ "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>",    desc = "Git reset buffer" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",    desc = "Git preview hunk" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>",        desc = "Git diff" },
		{
			"<leader>gb",
			function()
				require("gitsigns").blame_line { full = true }
			end,
			desc = "Git blame"
		},
		{ "<leader>gn", "<cmd>Gitsigns next_hunk<cr>",        desc = "Go to next hunk/change in buffer" },
		{ "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>",        desc = "Go to prev hunk/change in buffer" },
	},
}
