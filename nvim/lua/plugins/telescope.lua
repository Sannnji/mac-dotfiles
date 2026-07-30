return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = "Telescope",
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
			{ '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Open Recent' },
			{ '<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'Find word' }
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})

			-- Sorting extension
      telescope.load_extension("fzf")

			vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {
				fg = '#FFFFFF'
			})
    end,
  },  
}
