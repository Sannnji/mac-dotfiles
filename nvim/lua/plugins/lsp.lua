return {
  {
    "neovim/nvim-lspconfig",
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
        "lua_ls",
        "pyright",
      })
    end,

  },
}
