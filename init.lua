-- installs packer if needed
if require "first_load"() then return end

vim.g.mapleader = " "

require "plugins"
require "keymaps"
