-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

-- @type Base46HLGroupsList
M.override = {
  CursorLine = {
    -- bg = "#24222d",
    -- bg = "#272630"
    bg = "#292630",
    -- bg = "#171820"
    -- bg = "black2",
  },
  Comment = {
    italic = true,
    fg = "#696969",
  },

  ["@comment"] = {
    italic = true,
    fg = "#505055",
  },

  -- keyword
  Include = {
    -- fg = "#c79bf4",

    -- fg = "#F06292",
    -- fg = "#ff4081",
    fg = "#EC407A",
    -- fg = "#EF5350",
    -- fg = "#E57373",
    -- fg = "#E91E63",
    italic = true,
  },
  keyword = {
    italic = true,
    fg = "purple",
  },
  ["@keyword"] = {
    italic = true,
    fg = "purple",
  },
  ["@keyword.function"] = {
    italic = true,
    fg = "purple",
  },
  ["@keyword.return"] = {
    italic = true,
    fg = "purple",
  },
  ["@keyword.repeat"] = {
    italic = true,
    fg = "#54ea8d",
  },
  ["@keyword.conditional"] = {
    italic = true,
    fg = "#76FF03",
  },

  -- operator
  ["@operator"] = {
    -- fg = "#CE93D8",
    fg = "#9575cd",
  },
  ["@symbol"] = {
    italic = true,
  },

  -- flow control
  Repeat = {
    fg = "#54ea8d",
    italic = true,
  },
  Conditional = {
    italic = true,
    fg = "#69f0ae",
  },

  -- function
  ["@function.call"] = {
    fg = "orange",
  },
  ["@parameter"] = {
    fg = "#ffffff",
  },

  ["@function.macro"] = {
    fg = "#00B0FF",
  },

  -- structs
  Number = {
    fg = "#f78c55",
    -- fg = "#FF8A65",
  },
  Boolean = {
    -- fg = "#f78c55",
    fg = "#FF8A65",
    -- fg = "#FFAB91",
    -- fg = "#FFCC80",
  },
  ["@type.builtin"] = {
    -- italic = true,
    -- fg = "#9575cd",
    -- fg = "#f57f17",
    fg = "#ff9e80",
  },
  Type = {
    fg = "#82B1FF",
  },
  ["@property"] = {
    -- fg = "#F48FB1",
    -- fg = "#FF80AB",
    fg = "#F06292",
    -- fg = "#EC407A",
    -- fg = "#ff4081",
  },
  ["@variable"] = {
    fg = "#ffffff",
  },
  ["@field"] = {
    fg = "#80DEEA",
  },
  ["@field.key"] = {
    fg = "#f78c6c",
  },

  PmenuSel = {
    bg = "#8964d8",
    fg = "#ffffff",
  },

  -- cmp
  CmpItemAbbrMatch = {
    fg = "#8964d8",
  },
  CmpItemKindModule = {
    fg = "orange",
  },
  CmpItemKindSnippet = {
    fg = "teal",
  },
  CmpItemKindVariable = {
    fg = "pink",
  },
  CmpItemKindFunction = {
    fg = "blue",
  },
  CmpItemKindMethod = {
    fg = "blue",
  },
  CmpDoc = {
    bg = "NONE",
  },

  -- Nvim Tree
  NvimTreeFolderIcon = {
    fg = "#8964d8",
  },
  NvimTreeGitNew = {
    fg = "teal",
  },
  NvimTreeGitIgnored = {
    fg = "#54575d",
  },
  NvimTreeGitDirty = {
    fg = "red",
  },

  PreProc = {
    fg = "#FF1744",
  },

  -- ui
  FloatBorder = {
    fg = "dark_purple",
  },
}

-- @type HLTable
M.add = {
  NvimTreeOpenedFolderName = {
    fg = "green",
    bold = true,
  },
  NvimTreeGitStaged = {
    fg = "orange",
  },
  NeoTreeDirectoryIcon = {
    fg = "#8964d8",
  },
  NeoTreeDirectoryName = {
    fg = "#8964d8",
  },
  ["@type"] = {
    fg = "#82B1FF",
  },

  -- Rainabow
  RainbowDelimiterYellow = { fg = "#fdb61d" },
  RainbowDelimiterPurple = { fg = "#E040FB" },
  RainbowDelimiterRed = { fg = "#FF4081" },
  RainbowDelimiterBlue = { fg = "#6179ef" },
  RainbowDelimiterGreen = { fg = "#76FF03" },
  RainbowDelimiterOrange = { fg = "#f67535" },
  RainbowDelimiterTeal = { fg = "#00BFA5" },
  RainbowDelimiterviolet = { fg = "#946eaD" },
  RainbowDelimiterMoon = { fg = "#c4aA6D" },
}

return M
