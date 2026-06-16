return {
  {
    "mrjones2014/smart-splits.nvim",
    -- Must load eagerly: plugin/smart-splits.lua runs on startup and sets the
    -- IS_NVIM wezterm user var, which the wezterm side uses to decide whether to
    -- pass <C-h/j/k/l> through to nvim. Lazy-loading via `keys` never sets it,
    -- so wezterm grabs the keys for its own pane navigation instead.
    lazy = false,
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left window",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right window",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to below window",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to above window",
      },
    },
  },
}
