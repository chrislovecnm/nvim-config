local M = {}

M.config = {
	ensure_installed = "maintained",
	ignore_install = {},
	highlight = {
		enable = true, -- false will disable the whole extension
		use_languagetree = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
	-- indent = {enable = true, disable = {}}, -- EXPERIMENTAL feature
	-- textobjects = { enable = false }, todo: maybe later
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autotag = { enable = true },
}

M.setup = function()
	local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end

	local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

	parser_configs.http = {
		install_info = {
			url = "https://github.com/NTBBloodbath/tree-sitter-http",
			files = { "src/parser.c" },
			branch = "main",
		},
	}

	treesitter_configs.setup(M.config)
end

return M
