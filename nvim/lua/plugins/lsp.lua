return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,

    config = function()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },

            diagnostics = {
              globals = {
                'vim',
              },
            },
          },
        },
      })

      vim.lsp.enable({
        'lua_ls',
        'pyright',
      })

      vim.keymap.set(
				'n',
				'<leader>d',
        function ()
					vim.diagnostic.open_float({ focus = false })
				end,
				{ desc = 'Diagnostic Float' }
			)

			vim.diagnostic.config({
				float = {
					border = "rounded",
				},
			})
    end,
  },
}
