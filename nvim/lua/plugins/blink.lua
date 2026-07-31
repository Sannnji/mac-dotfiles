return {
	{
		'saghen/blink.cmp',
		version = '1.*',
		dependencies = {
			-- Optional: Provides snippets for the snippet source 
			'rafamadriz/friendly-snippets',
		},
		build = function()
			require('blink.cmp').build:pwait()
		end,
		opts = {
			-- do not open if in code companion
			enabled = function()
				return not vim.tbl_contains({ 'codecompanion', 'markdown' }, vim.bo.filetype)
			end,

			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	    -- 'super-tab' for mappings similar to vscode (tab to accept)
	    -- 'enter' for enter to accept
	    -- 'none' for no mappings
	    --
	    -- All presets have the following mappings:
	    --		C-space: Open menu or open docs if already open
	    --		C-n/C-p or Up/Down: Select next/previous item
	    --		C-e: Hide menu
	    --		C-k: Toggle signature help (if signature.enabled = true)
		  --
	    -- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { 
				preset = 'enter',
				['<Esc>'] = { 'hide', 'fallback' },
				['<Tab>'] = { 'select_and_accept', 'snippet_forward', 'fallback' },
			},

			-- [default]: Only show the documentation popup when manually triggered
			completion = {
				documentation = {
					auto_show = false
				},
			},

			-- [default]: List of enabled providers defined so that you can extend it
			sources = {
				default = {
					-- Gets completions from your Language Server Providers
					'lsp',
					-- Completes file paths
					'path',
					-- Shows code snippets/templates
					'snippets',
					-- Suggests words that already exist in your current open file
					'buffer'
				}
			}
		}
	},
}
