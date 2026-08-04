return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = require('shibuya.groups.special.lualine'),

				disabled_filetypes = {
					statusline = { 'neo-tree', 'codecompanion' },
					winbar = { 'neo-tree', 'codecompanion' }
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
		},
	},
}
