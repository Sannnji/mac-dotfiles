return {
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'rcarriga/nvim-notify',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		cmd = "Telescope",
		keys = {
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
			{ '<leader>fr', '<cmd>Telescope oldfiles<cr>',   desc = 'Open Recent' },
			{ '<leader>fw', '<cmd>Telescope live_grep<cr>',  desc = 'Find word' }
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({})

			-- Sorting extension
			telescope.load_extension("fzf")

			-- Notification history extension
			telescope.load_extension("notify")
		end,
	},
}
