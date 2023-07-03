local M = {}

M.abc = {
  n = {
    ["<leader>s"] = { ":w<CR>", "Save" },
    ["<leader>y"] = { "ggVG\"+y''", "Copy entire file"},
    ["J"] = { "4j"},
    ["K"] = { "4k"},
    ["H"] = { ":tabp<CR>"},
    ["L"] = { ":tabn<CR>"},
    ["<F5>"] = {"<cmd>:lua require('utils').format<CR>"}
  },

	i = {
		["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
	}
}

return M
