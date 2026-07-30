return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
			preset = 'modern',
			win = {
				-- border = 'rounded'
				height = { min = 10, max = 40}
			},
			layout = {
				width = {
					min = 30,
					max = 60,
				},
				spacing = 3,
			},
			spec = {
				-- General Binds
				{ '<leader>R', '<cmd>restart<cr>', desc = 'Restart Neovim' },
				-- Hydra Mode Binds
				{ '<leader>wf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
			},
    },
		keys = {
			{
				'<leader>w',
				function()
					require('which-key').show({
						keys = '<leader>w',
						loop = true,
					})
				end,
				desc = 'Hydra Mode',
			},
		},
  },
}
