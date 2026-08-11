return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},

		views = {
			cmdline_popup = {
				position = {
					row = 26,
					col = '50%',
				},
				size = {
					width = 60,
					height = 'auto',
				},
			},

			popupmenu = {
				enabled = true,
				relative = 'editor',
				format = {
					conceal = false,
				},
				position = {
					row = 29,
					col = '50%',
				},
				size = {
					width = 60,
					height = 10,
				},
				scrollbar = false,
				border = {
					style = 'rounded',
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = {
						Normal = 'Normal',
					},
				},
			},
		},
  },

	config = function(_, opts)
		require('noice').setup(opts)

		-- trigger the wildmenu (and thus noice's popupmenu view) as soon as
		-- the cmdline is entered/changed, instead of waiting for <Tab>
		vim.opt.wildmode = 'noselect:lastused,full'
		vim.opt.wildoptions = 'pum'

		vim.api.nvim_create_autocmd('CmdlineChanged', {
			pattern = { ':' },
			callback = function()
				vim.fn.wildtrigger()
			end,
		})
	end,
}
