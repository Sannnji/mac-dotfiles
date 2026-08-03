return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			direction = 'float',
			open_mapping = [[<c-\>]], -- Control + \
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = 'curved',
				-- width = 160,
				column = 75,
				height = 50,
				-- winblend = 3,
				zindex = 50,
				title_pos = 'center'
			},
			winbar = {
				enable = false
			}
		}
	}
}
