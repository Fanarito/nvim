return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
	init = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
	keys = {
		{
			"<leader>ma",
			function()
				local harpoon = require("harpoon")
				harpoon:list():add()
			end,
			desc = "Add mark"
		},
		{
			"<leader>mm",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Mark UI"
		},
		{
			"<leader>m<tab>",
			function()
				local harpoon = require("harpoon")
				harpoon:list():next()
			end,
			desc = "Go to next mark"
		},
		{
			"<leader>m<s-tab>",
			function()
				local harpoon = require("harpoon")
				harpoon:list():prev()
			end,
			desc = "Go to prev mark"
		},
		{
			"<leader>m1",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(1)
			end,
			desc = "Go to mark 1"
		},
		{
			"<leader>m2",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(2)
			end,
			desc = "Go to mark 2"
		},
		{
			"<leader>m3",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(3)
			end,
			desc = "Go to mark 3"
		},
		{
			"<leader>m4",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(4)
			end,
			desc = "Go to mark 4"
		},
	}
}
