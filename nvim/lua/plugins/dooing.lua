return {
	"atiladefreitas/dooing",
	config = function()
		require("dooing").setup({
			-- Save to ~/.local/share/nvim/
			save_path = vim.fn.stdpath("data") .. "/dooing_todos.json",

			-- Window settings
			window = {
        width = 120,						-- Width of the floating window
        height = 20,						-- Height of the floating window
        border = 'rounded',			-- Border style: 'single', 'double', 'rounded', 'solid'
				zindex = 50,						-- Base z-index for floating windows (uses zindex to zindex+5)
        position = 'center',		-- Window position: 'right', 'left', 'top', 'bottom', 'center',
																--									'top-right', 'top-left', 'bottom-right', 'bottom-left'
        padding = {
            top = 1,
            bottom = 1,
            left = 2,
            right = 2,
        },
			},

			quick_keys = true,

			-- Keybinds
			keymaps = {
        toggle_window = "<leader>td",
        new_todo = "a",
        create_nested_task = "n",
        toggle_todo = "x",
        delete_todo = "d",
        delete_completed = "D",
        close_window = "<Esc>",
        undo_delete = "u",
        add_due_date = "H",
        remove_due_date = "r",
        toggle_help = "?",
        toggle_tags = "t",
        toggle_priority = "<Space>",
        clear_filter = "c",
        edit_todo = "e",
        edit_tag = "e",
        edit_priorities = "p",
        delete_tag = "d",
        search_todos = "/",
        add_time_estimation = "T",
        remove_time_estimation = "R",
        import_todos = "I",
        export_todos = "E",
        remove_duplicates = "<leader>D",
        open_todo_scratchpad = "<leader>p",
        refresh_todos = "f",
			},
		})
	end,
}

