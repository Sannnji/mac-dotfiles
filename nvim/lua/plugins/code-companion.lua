return {
	{
		'olimorris/codecompanion.nvim',
		version = '^19.0.0',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
		},
		opts = {
			interactions = {
				-- Uses ACP and your LLM subscription
				chat = {
					adapter = 'claude_code',
				},

				-- Requires an API billing seperate from subscription
				-- inline = {
				--	adapter = 'openai'
				-- }
			},

			adapters = {
				acp = {
					claude_code = function()
						local token = vim.env.CLAUDE_CODE_OAUTH_TOKEN

						if not token or token == '' then
							error('CLAUDE_CODE_OAUTH_TOKEN is not set')
						end

						return require('codecompanion.adapters').extend(
							'claude_code',
							{ env = { CLAUDE_CODE_OAUTH_TOKEN = token } }
						)
					end,
				},
			},

			display = {
				chat = {
					window = {
						border = 'rounded',
						layout = 'vertical',
						position = 'right',
						width = 70,
						height = 1,

						opts = {
							number = false,
						}
					}
				}
			}

		},

		keys = {
			{
				'<leader>ac',
				'<cmd>CodeCompanionChat Toggle<cr>',
				desc = 'AI: Toggle Chat',
			},
			{
				'<leader>ai',
				'<cmd>CodeCompanion<cr>',
				mode = { 'n', 'v' },
				desc = 'AI: Inline Assistant',
			},
		},

		config = function( _, opts )
			-- Configure CodeCompanion first.
			require('codecompanion').setup(opts)

			-- Apply your custom status-dependent text styling.
			require('config.code-companion.success-failure-line').setup()
		end,
	},
}
