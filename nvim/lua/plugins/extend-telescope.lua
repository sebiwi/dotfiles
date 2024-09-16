return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults = {
      mappings = {
        i = {
          ["<c-t>"] = actions.select_tab,
        },
      },
    }
  end,
}
