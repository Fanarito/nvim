-- Mason is used to manage LSP servers
return {
	'williamboman/mason.nvim',
	lazy = false,
	config = true,
	cond = not vim.g.vscode,
}
