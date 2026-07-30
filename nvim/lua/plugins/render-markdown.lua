return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		ft = { 'markdown', 'codecompanion' },
		opts = {
			render_modes = true,

			sign = {
				enable = false,
			},

			bullet = {
				-- Icons used at each nesting level.
				icons = {
					'',
					'',
					'◆',
					'◇',
				},

				-- Highlight group used by the icon.
				highlight = 'RenderMarkdownBullet',
			},
		},

		config = function(_, opts)
			require('render-markdown').setup(opts)

			-- vim.api.nvim_set_hl(0, 'CodeCompanionChatHeader' , { fg = '#FFFFFF', bold = true })

			-- vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { bg = '#5D536E' })
			-- vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = '#FFFFFF' })

			-- vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = '#716F81' })
			-- vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInLine', { bg = 'NONE' })


			-- vim.api.nvim_set_hl(0, 'RenderMarkdownDash', { fg = '#716F81' })
			-- vim.api.nvim_set_hl(0, 'CodeCompanionChatToolFailureIcon', { fg = '#F38BA8' })
			-- vim.api.nvim_set_hl(0, 'CodeCompanionChatToolText', { fg = '#FD7979' })

			-- vim.api.nvim_set_hl(0, 'CodeCompanionDiffAdd', { bg = '#7EACB5' })
      -- vim.api.nvim_set_hl(0, 'CodeCompanionDiffDelete', { bg = '#C96868' })
		end,
	},
}
