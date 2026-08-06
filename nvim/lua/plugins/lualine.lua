local codecompanion_extension = {
	filetypes = {
		'codecompanion',
	},

	sections = {
		lualine_a = { 'mode' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = { 'filename' },
		lualine_y = {},
		lualine_z = {},
	},
}

return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = require('shibuya.groups.special.lualine'),

				disabled_filetypes = {
					statusline = { 'neo-tree' },
					winbar = { 'neo-tree' }
				},

				section_separators = { left = '', right = '' },
				component_separators = { left = '|', right = '|' },
			},

			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'encoding', 'fileformat', 'filetype', 'lsp_status' },
				lualine_y = {  },
				lualine_z = { 'location' }
			},

			inactive_sections = {
				lualine_a = {  },
				lualine_b = {  },
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {  },
				lualine_z = {  }
			},

			extensions = {
				codecompanion_extension,
			},
		},
	},
}
