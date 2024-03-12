local wk = require("which-key")

wk.register({
	["<leader>"] = {
		-- Window management
		w = {
			"Window",

			-- -- Navigation
			-- l = { "<cmd>wincmd l<cr>", "Go to window to the left" },
			-- h = { "<cmd>wincmd h<cr>", "Go to window to the right" },
			-- j = { "<cmd>wincmd j<cr>", "Go to window below" },
			-- k = { "<cmd>wincmd k<cr>", "Go to window above" },

			-- Moving

			-- Layout
			s = { "<cmd>split<cr>", "Split windows horiztonally" },
			v = { "<cmd>vsplit<cr>", "Split windows verticall" },
			c = { "<cmd>wincmd c<cr>", "Close window" },
			q = { "<cmd>qa<cr>", "Close all" },
		},

		q = {
			q = { "<cmd>qa<cr>", "Quit" },
		},

		f = {
			s = { "<cmd>w<cr>", "Save current buffer" },
		},

		["<tab>"] = { "<cmd>bprev<cr>", "Previous buffer" },
		["<s-tab>"] = { "<cmd>bnext<cr>", "Next buffer" },
	},
})

-- Setup diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error info", noremap = true })

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+Y')
