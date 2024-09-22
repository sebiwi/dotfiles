return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
  {
    "maxmx03/solarized.nvim",
    opts = {
      variant = "summer", -- "spring" | "summer" | "autumn" | "winter" (default)
      transparent = {
        enabled = true, -- Master switch to enable transparency
        pmenu = false, -- Popup menu (e.g., autocomplete suggestions)
        normal = true, -- Main editor window background
        normalfloat = false, -- Floating windows
        neotree = true, -- Neo-tree file explorer
        nvimtree = true, -- Nvim-tree file explorer
        whichkey = false, -- Which-key popup
        telescope = true, -- Telescope fuzzy finder
        lazy = false, -- Lazy plugin manager UI
        mason = false, -- Mason manage external tooling
      },
      on_highlights = function(colors, _)
        return {
          MatchParen = { reverse = true },
          LspReferenceRead = { fg = colors.cyan, bg = colors.base02, standout = true },
          LspReferenceWrite = { fg = colors.blue, bg = colors.base02, standout = true },
        }
      end,
    },
  },
}
