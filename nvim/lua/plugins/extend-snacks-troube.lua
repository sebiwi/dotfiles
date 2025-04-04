return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    if LazyVim.has("trouble.nvim") then
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          actions = {
            trouble_open = function(...)
              return require("trouble.sources.snacks").actions.trouble_open.action(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<c-t>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      })
    end
  end,
}
