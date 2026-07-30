-- prepend path before lazy starts
vim.opt.rtp:prepend('/Users/jamesji/Documents/GitHub/neo-theme')

require("config.lazy")
require('config.set-themes')
require('config.set-options')
require('config.set-keymaps')
