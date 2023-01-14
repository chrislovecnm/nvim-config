local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"glepnir/lspsaga.nvim",
	},
	event = "VeryLazy",
}

M.config = function()
	local function lspsaga_symbols()
		local exclude = {
			["terminal"] = true,
			["toggleterm"] = true,
			["prompt"] = true,
			["help"] = true,
			["starter"] = true,
		}
		if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
			return "" -- Excluded filetypes
		else
			local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
			if ok then
				if lspsaga:get_winbar() ~= nil then
					return lspsaga:get_winbar()
				else
					return "" -- Cannot get node
				end
			end
		end
	end

	require("lualine").setup({
		options = {
			theme = "nightfox",
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				"diff",
				"diagnostics",
				"overseer",
				lspsaga_symbols,
			},
			lualine_x = {
				"searchcount",
				"filetype",
				"fileformat",
				"encoding",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		extensions = { "quickfix", "toggleterm", "man", "nvim-dap-ui" },
	})
end

return M
