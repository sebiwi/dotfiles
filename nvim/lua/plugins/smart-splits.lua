return {
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      {
        "<A-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left window",
      },
      {
        "<A-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right window",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to below window",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to above window",
      },
    },
  },
}
