return {
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			local alpha = require('alpha')
			local dashboard = require('alpha.themes.dashboard')
			local cursor_hide = require('utils.cursor-hide')

			local logo = [[
██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
			]]

			dashboard.section.header.val = vim.split(logo, '\n')
			dashboard.section.buttons.val = {
				dashboard.button('f',		'󰱼  Find file',																		'<cmd>Telescope find_files<CR>'),
				dashboard.button('w',		'󰱽  Find word',																		'<cmd>Telescope live_grep<CR>'),
				dashboard.button('e',		'󰙅  File explorer',																'<cmd>Neotree toggle<CR>'),
				dashboard.button('r',		'󰋚  Recently opened files',												'<cmd>Telescope oldfiles<CR>'),
				dashboard.button('b',		'󰃀  Jump to bookmarks (unimplemented)',						'<cmd>Telescope marks<CR>'),
				dashboard.button('q',		'󰅚  Quit',																				'<cmd>qa<CR>'),
			}
			-- dashboard.section.footer.val = 'hello world!'

			dashboard.section.header.opts = { position = 'center' }
			dashboard.section.footer.opts = { position = 'center' }

			dashboard.opts.layout = {
				{ type = 'padding', val = 24 }, -- header top padding
				dashboard.section.header,
				{ type = 'padding', val = 2 }, -- padding between button and header
				dashboard.section.buttons,
				{ type = 'padding', val = 2 }, -- padding between footer and button
				dashboard.section.footer,
			}

			-- Space + a: :Alpha Shortcut
			vim.keymap.set('n', '<leader>A', '<cmd>Alpha<cr>')

			-- Wire the dashboard elements to the custom group names
			dashboard.section.header.opts.hl = 'AlphaHeader'

			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = 'AlphaButtons'
				button.opts.hl_shortcut = 'AlphaShortcut'

				-- Increase button width
				button.opts.width = 60
			end

			dashboard.section.footer.opts.hl = 'AlphaFooter'

			-- Hide cursor on the Alpha dashboard
			dashboard.config.opts.setup = function ()
				-- alpha-nvim calls opts.setup() every time the dashboard is (re)opened, so
				-- re-create this augroup each time rather than appending autocmds forever.
				local group = vim.api.nvim_create_augroup('AlphaCursorHide', { clear = true })

				vim.api.nvim_create_autocmd('User', {
					group = group,
					pattern = 'AlphaReady',
					desc = 'hide cursor for alpha',
					callback = cursor_hide.hide,
				})
				vim.api.nvim_create_autocmd('BufUnload', {
					group = group,
					buffer = 0,
					desc = 'show cursor after alpha',
					callback = cursor_hide.show,
				})
			end

			alpha.setup(dashboard.config)

			-- Disable folding on alpha buffer
			vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
		end,
  },
}
