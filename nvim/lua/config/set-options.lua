-- Set system clipboard copy to [y] rather than ["+y] 
vim.opt.clipboard = 'unnamedplus'

-- Remove ~ for every newline
vim.opt.fillchars:append({ eob = ' ' })

-- Set tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- Allow Neovim to use 24-bit hex colors
vim.opt.termguicolors = true

-- font color for line numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#6C7086' })
-- font color for current line number
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#CBA6F7', bold = true })
