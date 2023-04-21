local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		-- Rainbow parentheses by using tree-sitter
		"HiPhish/nvim-ts-rainbow2",
		-- Setting the commentstring based on the cursor location in a file
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- Autocreate/update html tags
		"windwp/nvim-ts-autotag",
		-- Additional textobjects for treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPost", "BufNewFile" },
}

M.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"comment",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"fish",
			"gitcommit",
			"gitignore",
			"go",
			"gomod",
			"html",
			"http",
			"javascript",
			"json",
			"latex",
			"lua",
			"luadoc",
			"make",
			"markdown",
			"markdown_inline",
			"prisma",
			"python",
			"rust",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
		ignore_install = {},
		sync_install = true,
		autotag = { enable = true },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		highlight = {
			enable = true,
			use_languagetree = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<TAB>",
				node_decremental = "<S-TAB>",
				scope_incremental = false,
			},
		},
		indent = { enable = true },
		matchup = {
			enable = true,
		},
		rainbow = {
			enable = true,
			-- Which query to use for finding delimiters
			query = "rainbow-parens",
			-- Highlight the entire buffer all at once
			strategy = require("ts-rainbow").strategy.global,
		},
	})
end

return M
