return {
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			local alpha = require('alpha')
			local theme = require('alpha.themes.dashboard')

			local logo = [[
██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
			]]

			theme.section.header.val = vim.split(logo, '\n')

			theme.section.buttons.val = {
				theme.button('f',		'󰱼  Find file',																		'<cmd>Telescope find_files<CR>'),
				theme.button('w',		'󰱽  Find word',																		'<cmd>Telescope live_grep<CR>'),
				theme.button('e',		'󰙅  File explorer',																'<cmd>Neotree toggle<CR>'),
				theme.button('r',		'󰋚  Recently opened files',												'<cmd>Telescope oldfiles<CR>'),
				theme.button('b',		'󰃀  Jump to bookmarks (unimplemented)',						'<cmd>Telescope marks<CR>'),
				theme.button('q',		'󰅚  Quit',																				'<cmd>qa<CR>'),
			}

			-- theme.section.footer.val = 'hello world!'

			theme.section.header.opts = { position = 'center' }
		  -- theme.section.buttons.opts = { position = 'center' } -- removes padding between buttons
			theme.section.footer.opts = { position = 'center' }

			theme.opts.layout = {
				{ type = 'padding', val = 24 }, -- header top padding
				theme.section.header,
				{ type = 'padding', val = 2 }, -- padding between button and header
				theme.section.buttons,
				{ type = 'padding', val = 2 }, -- padding between footer and button
				theme.section.footer,
			}

			-- Space + a: :Alpha Shortcut
			vim.keymap.set('n', '<leader>A', '<cmd>Alpha<cr>')

			-- Wire the dashboard elements to the custom group names
			theme.section.header.opts.hl = 'AlphaHeader'

			for _, button in ipairs(theme.section.buttons.val) do
				button.opts.hl = 'AlphaButtons'
				button.opts.hl_shortcut = 'AlphaShortcut'

				-- Increase button width
				button.opts.width = 60
			end

			theme.section.footer.opts.hl = 'AlphaFooter'

			alpha.setup(theme.config)
		end,
  },
}
