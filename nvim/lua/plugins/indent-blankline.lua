return {
	{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
		config = function()
			local hooks = require("ibl.hooks")

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, 'IblIndent', {
					fg = '#3B3B3B',
				})

				vim.api.nvim_set_hl(0, 'IblScope', {
					fg = '#6C6C6C',
				})
			end)

			require('ibl').setup({
				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
				}
			})
		end,
	}
}
