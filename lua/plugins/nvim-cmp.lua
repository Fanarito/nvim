-- nvim-cmp is used for autocompletion
return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{ 'L3MON4D3/LuaSnip' },
	},
	config = function()
		-- Here is where you configure the autocompletion settings.
		local lsp_zero = require('lsp-zero')
		lsp_zero.extend_cmp()

		-- And you can configure cmp even more, if you want to.
		local cmp = require('cmp')
		local cmp_action = lsp_zero.cmp_action()

		cmp.setup({
			formatting = lsp_zero.cmp_format(),
			mapping = cmp.mapping.preset.insert({
				-- `Enter` key to confirm completion
				['<CR>'] = cmp.mapping.confirm({ select = false }),

				-- Ctrl+Space to trigger completion menu
				['<C-Space>'] = cmp.mapping.complete(),

				['<Tab>'] = cmp_action.luasnip_supertab(),
				['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
			})
		})
	end
}
