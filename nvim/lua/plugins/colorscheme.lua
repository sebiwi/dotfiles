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
        pmenu = true, -- Popup menu (e.g., autocomplete suggestions)
        normal = true, -- Main editor window background
        normalfloat = true, -- Floating windows
        neotree = true, -- Neo-tree file explorer
        nvimtree = true, -- Nvim-tree file explorer
        whichkey = true, -- Which-key popup
        telescope = true, -- Telescope fuzzy finder
        lazy = false, -- Lazy plugin manager UI
        mason = false, -- Mason manage external tooling
      },
    },
  },
}
