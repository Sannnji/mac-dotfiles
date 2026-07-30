return {
	{
		'akinsho/bufferline.nvim',
		enabled = false,
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = {
			options = {
				mode = 'buffers',
				tab_size = 0,
				show_buffer_close_icons = false,
				themable = true,
			},
			-- highlights = require('neo-theme.groups.special.bufferline').get_theme()()
			highlights = {
				fill = {
					bg = 'none',
					fg = 'none'
				},
				background = {
					fg = 'NONE',
					bg = 'NONE'
				}
			}
		},
	},
}
