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
		filetypes = {
			sh = function()
				if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
					-- disable for .env files
					return false
				end
				return true
			end,
		}
	},
	cond = not vim.g.vscode,
}
