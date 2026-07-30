-- ============================================= General Keybinds =============================================


-- ============================================ Text Editing Binds ============================================

-- Option + Left/Right: previous/next word
vim.keymap.set("n", "<M-Left>", "b", { desc = "Move back one word" })
vim.keymap.set("n", "<M-Right>", "w", { desc = "Move forward one word" })

vim.keymap.set("i", "<M-Left>", "<C-o>b", { desc = "Move back one word" })
vim.keymap.set("i", "<M-Right>", "<C-o>w", { desc = "Move forward one word" })

-- Command + Left/Right
-- Kitty sends these as Ctrl+Left/Right
vim.keymap.set('n', '<C-Left>', '^', { desc = 'Move to first non-whitespace character' })
vim.keymap.set('n', '<C-Right>', 'g_', { desc = 'Move to last non-whitespace character' })

vim.keymap.set("i", "<C-Left>", "<C-o>^", { desc = "Move to first non-whitespace character" })
vim.keymap.set("i", "<C-Right>", "<C-o>g_<Right>", { desc = "Move to last non-whitespace character" })

-- Command + Up/Down: top/bottom of file
-- Kitty sends these as Ctrl+Home and Ctrl+End
vim.keymap.set("i", "<C-Home>", "<C-o>gg", { desc = "Move to top of file" })
vim.keymap.set("i", "<C-End>", "<C-o>G", { desc = "Move to bottom of file" })

-- Option + Delete and Command + Delete technically do not need mappings
-- because Kitty sends Ctrl-W and Ctrl-U directly.
-- But you can include these for clarity:
vim.keymap.set("i", "<C-w>", "<C-w>", { desc = "Delete previous word" })
vim.keymap.set("i", "<C-u>", "<C-u>", { desc = "Delete to beginning of line" })

-- Insert mode undo / redo
vim.keymap.set("i", "<D-z>", "<C-o>u", { desc = "Undo" })
vim.keymap.set("i", "<D-S-z>", "<C-o><C-r>", { desc = "Redo" })

-- Shift + Arrow: select by character/line
vim.keymap.set("i", "<S-Left>", "<Esc>vhi", { desc = "Select left" })
vim.keymap.set("i", "<S-Right>", "<Esc>vli", { desc = "Select right" })

-- Option + Shift + Left/Right: select by word
vim.keymap.set("i", "<M-S-Left>", "<Esc>vbi", { desc = "Select previous word" })
vim.keymap.set("i", "<M-S-Right>", "<Esc>vwi", { desc = "Select next word" })

-- Command + Shift + Left/Right: select to start/end of line
vim.keymap.set("i", "<D-S-Left>", "<Esc>v0i", { desc = "Select to start of line" })
vim.keymap.set("i", "<D-S-Right>", "<Esc>v$i", { desc = "Select to end of line" })
