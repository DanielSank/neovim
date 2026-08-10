return {
  "smoka7/hop.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  keys = {
    -- Hop forward (after cursor)
    {
      "<Leader>j",
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({ direction = directions.AFTER_CURSOR })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop Word Forward",
    },

    -- Hop backward (before cursor)
    {
      "<leader>k",
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({ direction = directions.BEFORE_CURSOR })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop Word Backward",
    },

    -- Current line forward search
    {
      "<leader>l",
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({
          direction = directions.AFTER_CURSOR,
          current_line_only = true
        })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop Char Forward (Line)",
    },

    -- Current line backward search
    {
      "<leader>h",
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({
          direction = directions.BEFORE_CURSOR,
          current_line_only = true
      })
      end,
      mode = { "n", "x", "o" },
      desc = "Hop Char Backward (Line)",
    },
  },
}
