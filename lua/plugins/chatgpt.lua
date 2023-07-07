local M = {
	"jackMort/ChatGPT.nvim",
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "pass private/openai_api_key",
			edit_with_instructions = {
				diff = false,
				keymaps = {
					close = "<C-c>",
					accept = "<C-y>",
					toggle_diff = "<C-d>",
					toggle_settings = "<C-o>",
					cycle_windows = "<Tab>",
					use_output_as_input = "<C-i>",
				},
			},
			chat = {
				welcome_message = "",
				keymaps = {
					close = { "<C-c>" },
					yank_last = "<C-y>",
					yank_last_code = "<C-k>",
					scroll_up = "<C-u>",
					scroll_down = "<C-d>",
					new_session = "<C-n>",
					cycle_windows = "<Tab>",
					cycle_modes = "<C-f>",
					select_session = { "<Space>", "o", "<cr>" },
					rename_session = "r",
					delete_session = "d",
					draft_message = "<C-d>",
					toggle_settings = "<C-o>",
					toggle_message_role = "<C-r>",
					toggle_system_role_open = "<C-s>",
				},
			},
			openai_params = {
				model = "gpt-3.5-turbo-16k-0613",
				-- model = "gpt-4",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 300,
				temperature = 0,
				top_p = 1,
				n = 1,
			},
			openai_edit_params = {
				-- model = "gpt-3.5-turbo-instruct",
				model = "code-davinci-edit-001",
				temperature = 0,
				top_p = 1,
				n = 1,
			},
			show_quickfixes_cmd = "Trouble quickfix",
			actions_paths = { "~/.config/nvim/custom_actions.json" },
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cmd = {
		"ChatGPT",
		"ChatGPTActAs",
		"ChatGPTEditWithInstructions",
		"ChatGPTRun",
		"ChatGPTRunCustomCodeAction",
	},
}

return M
