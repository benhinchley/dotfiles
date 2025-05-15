vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false

-- remap ; to :, and vice versa
vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('n', ':', ';', { noremap = true })

vim.keymap.set('v', ';', ':', { noremap = true })
vim.keymap.set('v', ':', ';', { noremap = true })

vim.o.cursorline = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Install `lazy.nvim` plugin manager
-- https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Configure and install plugins
require('lazy').setup({
	'NMAC427/guess-indent.nvim',
	'tpope/vim-vinegar',
	{ 
		'echasnovski/mini.nvim',
		config = function()
			require('mini.surround').setup()
			require('mini.comment').setup()

			local statusline = require('mini.statusline')
			statusline.setup({ use_icons = false })
		end

	},
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		config = function()
			require('tokyonight').setup({
				styles = { comments = { italic = false } }
			})

			vim.cmd.colorscheme 'tokyonight-moon'
		end
	}
})

-- vim: ts=2 sts=2 sw=2 et
