return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')

      npairs.setup({})

      npairs.add_rules({
        Rule(' ', ' ')
          :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '[]', '{}' }, pair)
          end),

        Rule('( ', ' )')
          :with_pair(cond.none())
          :with_move(function(opts)
            return opts.char == ')'
          end)
          :use_key(')'),

        Rule('{ ', ' }')
          :with_pair(cond.none())
          :with_move(function(opts)
            return opts.char == '}'
          end)
          :use_key('}'),

        Rule('[ ', ' ]')
          :with_pair(cond.none())
          :with_move(function(opts)
            return opts.char == ']'
          end)
          :use_key(']'),
      })
    end,
  },
}

