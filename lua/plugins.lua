return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Improve startup time
	use("lewis6991/impatient.nvim")

	-- Improved Typescript LSP config
	use("jose-elias-alvarez/typescript.nvim")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
		after = { "nvim-cmp", "typescript.nvim" },
	})

	-- use Neovim as a language server
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("config.null-ls").setup()
		end,
	})

	-- Nicer diagnostics
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("trouble").setup({ auto_preview = false, auto_fold = true, auto_close = true })
		end,
	})

	-- Swap parameters easier
	use("mizlan/iswap.nvim")

	-- Better % navigation
	use("andymass/vim-matchup")

	-- Useful lua function collection
	use("nvim-lua/plenary.nvim")

	-- Devicons
	use("kyazdani42/nvim-web-devicons")

	-- Display popup with possible keybindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("config.which-key").setup()
		end,
	})

	-- Comment toggler
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("config.comment").setup()
		end,
	})

	-- Project management
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("config.project").setup()
		end,
		requires = "nvim-telescope/telescope.nvim",
	})

	-- Fuzzy filtering
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope").setup()
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	-- Filebrowsing in telescope
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Pass custom grep options to text search
	use("nvim-telescope/telescope-live-grep-args.nvim")

	-- Undo tree in telescope
	use("debugloop/telescope-undo.nvim")

	-- FZF sorter for telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		config = function()
			require("telescope").load_extension("fzf")
		end,
		requires = "nvim-telescope/telescope.nvim",
		run = "make",
	})

	-- Status bar
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine").setup()
		end,
		requires = "kyazdani42/nvim-web-devicons",
		after = { "nightfox.nvim" },
	})

	-- Colorscheme
	use({
		"EdenEast/nightfox.nvim",
		config = function()
			require("config.nightfox").setup()
		end,
		run = ':lua require("nightfox").compile()',
	})

	-- HTTP client in Neovim
	use({
		"NTBBloodbath/rest.nvim",
		config = function()
			require("config.rest").setup()
		end,
		requires = "nvim-lua/plenary.nvim",
		ft = { "http" },
	})

	-- Color highlighter
	use({
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("config.colorizer").setup()
		end,
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = "rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = { "$HOME/.vscode/extensions/amimaro.remix-run-snippets-1.1.0" },
			})
		end,
	})

	-- VSCode-like pictograms for neovim lsp completion items
	use("onsails/lspkind-nvim")

	-- Completion & Snippets
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("mtoohey31/cmp-fish")
	use("octaltree/cmp-look")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use({
		"hrsh7th/nvim-cmp",
		after = {
			"lspkind-nvim",
			"LuaSnip",
			"cmp_luasnip",
			"cmp-nvim-lua",
			"cmp-nvim-lsp",
			"cmp-buffer",
			"cmp-path",
			"cmp-look",
			"cmp-calc",
			"cmp-fish",
			"cmp-emoji",
		},
		config = function()
			require("config.cmp").setup()
		end,
	})

	-- Enhanced search and replace
	use({
		"windwp/nvim-spectre",
		config = function()
			require("config.spectre").setup()
		end,
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs").setup()
		end,
		after = { "nvim-cmp" },
	})

	-- Using mini.nvim for starter screen and trailing space detection
	use({
		"echasnovski/mini.nvim",
		config = function()
			require("config.mini").setup()
		end,
	})

	-- Clipboard management
	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("config.neoclip").setup()
		end,
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "tami5/sqlite.lua" },
		},
	})

	-- Go development
	use({
		"ray-x/go.nvim",
		config = function()
			require("config.go").setup()
		end,
		ft = { "go", "gomod" },
	})

	-- Enhanced movement plugin
	use({
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		as = "hop",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.treesitter").setup()
		end,
		run = ":TSUpdate",
	})

	-- Improved incremental/decremental function
	use({
		"monaqa/dial.nvim",
		config = function()
			require("config.dial").setup()
		end,
	})

	-- Setting the commentstring based on the cursor location in a file
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Rainbow parentheses by using tree-sitter
	use({
		"p00f/nvim-ts-rainbow",
		after = "nvim-treesitter",
	})

	-- Autocreate/update html tags
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Adds indentation guides to all lines
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.indent-blankline").setup()
		end,
	})

	-- Better quickfix
	use({ "kevinhwang91/nvim-bqf" })

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns").setup()
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	-- GitHub integration for issues and prs
	use({
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	})

	-- Generate shareable file permalinks
	use("ruifm/gitlinker.nvim")

	-- Markdown
	use({
		"toppair/peek.nvim",
		run = "deno task --quiet build:fast",
		ft = "markdown",
		config = function()
			require("config.peek").setup()
		end,
	})

	-- HTML/JS
	use({
		"turbio/bracey.vim",
		ft = { "html", "javascript" },
		run = 'sh -c "npm install --prefix server"',
	})

	-- Check git history
	use("sindrets/diffview.nvim")

	-- File manager
	use({
		"luukvbaal/nnn.nvim",
		config = function()
			require("config.nnn").setup()
		end,
	})

	-- Highlight todo comments
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("config.todo").setup()
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	-- Terminal
	use({
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("config.terminal").setup()
		end,
	})

	-- Bookmarks
	use("MattesGroeger/vim-bookmarks")

	-- Bookmarks telescope integration
	use({
		"tom-anders/telescope-vim-bookmarks.nvim",
		config = function()
			require("telescope").load_extension("vim_bookmarks")
		end,
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "MattesGroeger/vim-bookmarks" },
		},
	})

	-- Tabline plugin
	use({
		"romgrk/barbar.nvim",
		config = function()
			require("config.barbar").setup()
		end,
		requires = "kyazdani42/nvim-web-devicons",
		after = { "nightfox.nvim" },
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		ft = {
			"go",
			"javascript",
			"javascriptreact",
			"python",
			"typescript",
			"typescriptreact",
		},
		requires = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mxsdev/nvim-dap-vscode-js",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			require("config.dap").setup()
		end,
	})

	-- Testing plugin
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
			"haydenmeade/neotest-jest",
		},
		ft = {
			"go",
			"javascript",
			"javascript.jsx",
			"javascriptreact",
			"python",
			"typescript",
			"typescript.tsx",
			"typescriptreact",
		},
		config = function()
			require("config.neotest").setup()
		end,
	})

	-- Run blocks of code
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		config = function()
			require("config.sniprun").setup()
		end,
	})

	-- GitHub Copilot
	use({
		"github/copilot.vim",
		config = function()
			require("config.copilot").setup()
		end,
	})

	-- Highlight function arguments
	use({
		"m-demare/hlargs.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("hlargs").setup()
		end,
	})

	-- Maintaining my notes/zettelkasten
	use({
		"mickael-menu/zk-nvim",
		config = function()
			require("config.zk").setup()
		end,
	})

	-- Quick annotation generator
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- Enhanced folds
	use({
		"kevinhwang91/nvim-ufo",
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype)
					return { "treesitter", "indent" }
				end,
			})
		end,
		requires = "kevinhwang91/promise-async",
	})

	-- Improved LSP UI
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({
				code_action_lightbulb = {
					virtual_text = false,
					enable_in_insert = false,
				},
				symbol_in_winbar = {
					enable = false,
				},
				show_outline = {
					jump_key = "<CR>",
				},
				max_preview_lines = 50,
			})
		end,
	})

	-- Change strings to template string on the fly in jsx/tsx
	use({
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup()
		end,
	})

	-- Add/change/delete surrounding delimiter pairs
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	-- Refactoring library based off the Refactoring book by Martin Fowler
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup({})
		end,
	})

	-- Post to pastebins easily
	use({
		"rktjmp/paperplanes.nvim",
		config = function()
			require("config.paperplanes").setup()
		end,
	})

	-- Scrollbar for Neovim
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
			require("scrollbar.handlers.gitsigns").setup()
		end,
	})

	-- Task runner for Neovim
	use({
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()
		end,
	})

	-- Improve default vim.ui interfaces
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("config.dressing").setup()
		end,
	})

	-- Open files from terminal window in the same neovim instance
	use("samjwill/nvim-unception")

	-- JSON schemas for Neovim
	use("b0o/schemastore.nvim")

	-- Training for vim movements
	use("ThePrimeagen/vim-be-good")

	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
end)
