local M = {}

local api = vim.api

-- Namespace used for our conditional text highlights.
local namespace = api.nvim_create_namespace(
  'CodeCompanionToolStatusText'
)

-- Map CodeCompanion's internal statuses to highlight groups.
local status_highlights = {
  completed = 'CodeCompanionChatToolSuccess',
  failed = 'CodeCompanionChatToolFailure',
}


local function set_highlights()
  -- Text color for successful tool results.
  api.nvim_set_hl(0, 'CodeCompanionChatToolSuccess', {
    fg = '#A6E3A1',
    bg = 'NONE',
  })

  -- Text color for failed, rejected, or cancelled tool results.
  api.nvim_set_hl(0, 'CodeCompanionChatToolFailure', {
    fg = '#F38BA8',
    bg = 'NONE',
  })

  -- Success icon.
  api.nvim_set_hl(0, 'CodeCompanionChatToolSuccessIcon', {
    fg = '#A6E3A1',
    bg = 'NONE',
  })

  -- Failure icon.
  api.nvim_set_hl(0, 'CodeCompanionChatToolFailureIcon', {
    fg = '#F38BA8',
    bg = 'NONE',
    nocombine = true,
  })
end


function M.setup()
  set_highlights()

  local icons =
    require('codecompanion.interactions.chat.ui.icons')

  -- Avoid wrapping icons.apply more than once when reloading config.
  if icons._conditional_text_highlights_applied then
    return
  end

  icons._conditional_text_highlights_applied = true

  local original_apply = icons.apply

  icons.apply = function(bufnr, line, status, opts)
    -- Let CodeCompanion draw its normal virtual icon and text highlight.
    local icon_id = original_apply(
      bufnr,
      line,
      status,
      opts
    )

    if not api.nvim_buf_is_valid(bufnr) then
      return icon_id
    end

    if line < 0 or line >= api.nvim_buf_line_count(bufnr) then
      return icon_id
    end

    -- Remove any previous conditional highlight from this line.
    api.nvim_buf_clear_namespace(
      bufnr,
      namespace,
      line,
      line + 1
    )

    local highlight = status_highlights[status]

    -- Pending and in-progress states keep CodeCompanion's default color.
    if not highlight then
      return icon_id
    end

    local text = api.nvim_buf_get_lines(
      bufnr,
      line,
      line + 1,
      false
    )[1] or ''

    if text == '' then
      return icon_id
    end

    -- Overlay the appropriate success or failure text color.
    api.nvim_buf_set_extmark(bufnr, namespace, line, 0, {
      end_col = #text,
      hl_group = highlight,
      hl_mode = 'replace',
      priority = 300,
    })

    return icon_id
  end
end


return M
