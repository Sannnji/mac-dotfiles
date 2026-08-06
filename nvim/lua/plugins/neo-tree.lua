return {
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		cmd = 'Neotree',
		keys = {
			{
				'<leader>E',
				'<cmd>Neotree toggle<cr>',
				desc = 'Toggle Neo-Tree',
			},
			{
				'<leader>e',
				'<cmd>Neotree focus<cr>',
				desc = 'Focus Neo-Tree',
			}
		},
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
				}
			}
		},
		config = function(_, opts)
			require('neo-tree').setup(opts)

			-- Hide cursor in Neo-Tree
			local cursor_hide = require('utils.cursor-hide')
			local group = vim.api.nvim_create_augroup('NeotreeCursorHide', { clear = true })
			vim.api.nvim_create_autocmd('FileType', {
				group = group,
				pattern = 'neo-tree',
				callback = function()
					vim.api.nvim_create_autocmd('BufEnter', {
						group = group,
						buffer = 0,
						callback = cursor_hide.hide,
					})
					vim.api.nvim_create_autocmd('BufLeave', {
						group = group,
						buffer = 0,
						callback = cursor_hide.show,
					})
				end,
			})

		end,
	},
}
