return {
	-- language parser
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter').setup()
			vim.api.nvim_create_autocmd('FileType', {
				pattern = '*',
				callback = function()
					local ok = pcall(vim.treesitter.start)
					if ok then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
		dependencies = {
			-- auto load
			'HiPhish/rainbow-delimiters.nvim',
		},
	},

	-- rainbow parentheses with ts
	{
		'HiPhish/rainbow-delimiters.nvim',
		lazy = true,
		submodules = false,
		config = function()
			local rainbow = require('rainbow-delimiters')
			require('rainbow-delimiters.setup')({
				strategy = {
					[''] = rainbow.strategy['global'],
					vim = rainbow.strategy['local'],
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
				},
				highlight = {
					'RainbowDelimiterRed',
					'RainbowDelimiterYellow',
					'RainbowDelimiterBlue',
					'RainbowDelimiterOrange',
					'RainbowDelimiterGreen',
					'RainbowDelimiterViolet',
					'RainbowDelimiterCyan',
				},
			})
		end,
	},
}
