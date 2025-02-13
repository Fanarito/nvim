return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- { "hrsh7th/cmp-nvim-lsp" },
		{ 'saghen/blink.cmp' },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Highlight the word under the cursor
		{
			"RRethy/vim-illuminate",
			setup = function()
				require("illuminate").configure({})
			end,
		},
	},
	config = function()
		-- This is where all the LSP shenanigans will live
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()

		lsp_zero.set_server_config({
			inlay_hints = {
				enabled = true,
				-- only_current_line = true,
				-- only_current_line_autocmd = "CursorHold",
				-- only_current_line_delay = 1000,
			},
		})

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					-- (Optional) Configure lua language server for neovim
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})
	end,
	cond = not vim.g.vscode,
}
