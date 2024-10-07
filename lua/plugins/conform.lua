return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { { "prettier", "prettierd" } },
			go = { "goimports", "gofmt" },
		},

		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end

			-- These options will be passed to conform.format()
			return {
				timeout_ms = 500,
				lsp_fallback = true,
			};
		end,
	},
	init = function()
		-- Add command FormatDisable that disables autoformatting until reenabled.
		-- You can use FormatDisable! to disable just for the current buffer.
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		-- Renable autoformatting.
		vim.api.nvim_create_user_command("FormatEnable", function(args)
			if args.bang then
				-- FormatEnable! will enable formatting just for this buffer
				vim.b.disable_autoformat = false
			else
				vim.g.disable_autoformat = false
			end
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format()
			end,
			desc = "Format",
		},
	},
	cond = not vim.g.vscode,
}
