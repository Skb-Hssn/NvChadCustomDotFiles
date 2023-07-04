---@type ChadrcConfig 
local M = {}
M.ui = {
    theme = 'ayu_dark',
    statusline = {
        theme = "default",
        separator_style = "block",
    },
}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"
return M
