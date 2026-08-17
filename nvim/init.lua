-- Allow Neovim to use 24-bit hex colors
-- Must be set here, otherwise colorizer will complain
vim.opt.termguicolors = true

require("config.lazy")
require('config.set-themes')
require('config.set-options')
require('config.set-keymaps')
