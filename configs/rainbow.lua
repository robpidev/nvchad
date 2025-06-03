local rainbow_delimiters = require "rainbow-delimiters"

vim.g.rainbow_delimiters = {
  strategy = {
    [""] = rainbow_delimiters.strategy["global"],
    commonlisp = rainbow_delimiters.strategy["local"],
  },
  query = {
    [""] = "rainbow-delimiters",
    lua = "rainbow-blocks",
  },
  highlight = {
    "RainbowDelimiterYellow",
    "RainbowDelimiterPurple",
    "RainbowDelimiterRed",
    "RainbowDelimiterTeal",
    "RainbowDelimiterBlue",
    "RainbowDelimiterGreen",
    "RainbowDelimiterOrange",
    "RainbowDelimiterviolet",
    "RainbowDelimiterMoon",
  },
  -- blacklist = { "c", "cpp" },
}
