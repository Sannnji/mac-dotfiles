local M = {}

function M.hide()
	-- nvim_set_hl drops a highlight with only `blend` and no fg/bg
	-- (nothing "real" to store), so a color must be present; its
	-- value doesn't matter since blend=100 makes it fully
	-- transparent regardless.
	vim.api.nvim_set_hl(0, 'Cursor', { fg = '#000000', bg = '#000000', blend = 100 })
	vim.opt.guicursor:append('a:Cursor/lCursor')
end

function M.show()
	vim.api.nvim_set_hl(0, 'Cursor', {})
	vim.opt.guicursor:remove('a:Cursor/lCursor')
end

return M
