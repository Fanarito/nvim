return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = false,
			auto_trigger = false,
			-- keymap = {
			-- 	accept = "<M-l>",
			-- 	accept_word = false,
			-- 	accept_line = false,
			-- 	next = "<M-]>",
			-- 	prev = "<M-[>",
			-- 	dismiss = "<C-]>",
			-- },
		},
		panel = { enabled = false },
	},
	cond = not vim.g.vscode,
}
