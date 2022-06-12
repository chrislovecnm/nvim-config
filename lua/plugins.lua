return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Improve startup time
	use("lewis6991/impatient.nvim")

	-- Improved Typescript lsp config
	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
		after = { "nvim-cmp", "nvim-lsp-ts-utils" },
	})

	-- Nicer diagnostics
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("trouble").setup({ auto_preview = false, auto_fold = true, auto_close = true })
		end,
	})

	-- Better code action menu
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	-- Nicer code action signs
	use("kosayoda/nvim-lightbulb")

	-- Swap parameters easier
	use("mizlan/iswap.nvim")

	-- Better % navigation
	use("andymass/vim-matchup")

	-- Misc
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- Display popup with possible keybindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("config.which-key").setup()
		end,
	})

	-- Asynctasks
	use("skywind3000/asyncrun.vim")
	use("skywind3000/asynctasks.vim")

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
		requires = { { "nvim-telescope/telescope.nvim" } },
	})

	-- Fuzzy filtering
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope").setup()
		end,
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		config = function()
			require("telescope").load_extension("fzf")
		end,
		requires = { { "nvim-telescope/telescope.nvim" } },
		run = "make",
	})

	-- Status bar
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine").setup()
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		after = { "nvim-gps", "nightfox.nvim" },
	})

	-- Show scope in status bar
	use({
		"SmiteshP/nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
		requires = "nvim-treesitter/nvim-treesitter",
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
		requires = { "nvim-lua/plenary.nvim" },
		ft = { "http" },
		commit = "e5f68db73276c4d4d255f75a77bbe6eff7a476ef",
	})

	-- Color highlighter
	use({
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		config = function()
			require("colorizer").setup()
		end,
		ft = { "html", "css", "json", "yaml", "conf" },
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	})

	-- VSCode-like pictograms for neovim lsp completion items
	use("onsails/lspkind-nvim")

	-- Completion & Snippets
	use("andersevenrud/cmp-tmux")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("mtoohey31/cmp-fish")
	use("octaltree/cmp-look")
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
			"cmp-tmux",
			"cmp-look",
			"cmp-calc",
			"cmp-fish",
			"cmp-emoji",
		},
		config = function()
			require("config.cmp").setup()
		end,
	})

	use({
		"gelguy/wilder.nvim",
		config = function()
			require("config.wilder").setup()
		end,
	})

	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("config.signature").setup()
		end,
		after = { "nvim-cmp" },
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

	-- Using mini.nvim for surround text object plugin and trailing space detection
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
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Github
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
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		run = "cd app && yarn install",
	})

	-- HTML/JS
	use({
		"turbio/bracey.vim",
		ft = { "html", "javascript", "typescript" },
		run = 'sh -c "npm install --prefix server"',
	})

	-- Lazygit in Neovim
	use("kdheepak/lazygit.nvim")

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
		requires = { "kyazdani42/nvim-web-devicons" },
		after = { "nightfox.nvim" },
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
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
			require("config.dap").setup()
		end,
	})

	use({
		"rcarriga/nvim-dap-ui",
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
			require("dapui").setup()
		end,
		after = "nvim-dap",
	})

	use({
		"theHamsta/nvim-dap-virtual-text",
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
			require("nvim-dap-virtual-text").setup()
		end,
		after = "nvim-dap",
	})

	use({
		"rcarriga/vim-ultest",
		requires = { "vim-test/vim-test" },
		run = ":UpdateRemotePlugins",
		ft = {
			"go",
		},
	})

	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		config = function()
			require("config.sniprun").setup()
		end,
	})

	-- Github Copilot
	use({
		"github/copilot.vim",
		config = function()
			require("config.copilot").setup()
		end,
	})

	use({ "mg979/vim-visual-multi" })

	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("hlargs").setup()
		end,
	})

	use({
		"mickael-menu/zk-nvim",
		config = function()
			require("config.zk").setup()
		end,
	})

	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})
end)
