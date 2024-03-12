-- nvim-cmp is used for autocompletion
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{
			"zbirenbaum/copilot-cmp",
			dependencies = { "zbirenbaum/copilot.lua" },
			config = function()
				require("copilot_cmp").setup()
			end,
		},
		{ "onsails/lspkind.nvim" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_cmp()

		-- Setup formatting
		local lspkind = require("lspkind")

		-- Add copilot icon
		lspkind.init({
			symbol_map = {
				Copilot = "",
			},
		})

		-- Color the copilot completion
		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

		local formatting = lsp_zero.cmp_format()
		formatting.format = lspkind.cmp_format({
			maxwidth = 100,
		})

		--
		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		local cmp = require("cmp")

		cmp.setup({
			formatting = formatting,
			mapping = cmp.mapping.preset.insert({
				-- Select the next item
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the prev item
				["<C-p>"] = cmp.mapping.select_prev_item(),
				-- Accept the completion
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				-- Trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- -- `Enter` key to confirm completion
				-- ['<CR>'] = cmp.mapping.confirm({ select = false }),
				--
				-- ['Tab'] = vim.schedule_wrap(function(fallback)
				-- 	if cmp.visible() and has_words_before() then
				-- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 	else
				-- 		fallback()
				-- 	end
				-- end),

				-- ['<Tab>'] = cmp_action.luasnip_supertab(),
				-- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
			}),
			sources = {
				-- Copilot Source
				{ name = "copilot", group_index = 2 },
				-- Other Sources
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
				{ name = "path", group_index = 2 },
			},
		})
	end,
}
