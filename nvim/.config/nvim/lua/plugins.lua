-- 1
vim.pack.add({
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
})

-- 2
vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason").setup({})
require("mason-lspconfig").setup({
	automatic_installation = true,
})

-- 3
vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require('lualine').setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_c = {
			{ 'filename', path = 1, symbols = { modified = ' ●' } },
			{
				function()
					local clients = vim.lsp.get_clients({ bufnr = 0 })
					if #clients == 0 then return 'LSP: off' end
					local names = {}
					for _, c in ipairs(clients) do
						table.insert(names, c.name)
					end
					return table.concat(names, ', ')
				end,
			},
			{ 'diagnostics', sources = { 'nvim_diagnostic' } },
		},
	},
})


-- 5
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "none",
		["<C-y>"] = { "show" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		}
	},

	cmdline = {
		enabled = true,
		completion = { menu = { auto_show = true } },
		keymap = {
			preset = 'inherit',
			['<CR>'] = { 'accept_and_enter', 'fallback' },
		},
	},
})

-- 6
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/snacks.nvim" },
})

require('snacks').setup({
	explorer = { enabled = true },
	scroll = { enabled = true },
	lazygit = { enabled = true },
	rename = { enabled = true },
	terminal = { enabled = true },
	words = { enabled = true },
	indent = { enabled = true },
	image = { enabled = true },
	statuscolumn = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
		width = { min = 40, max = 0.4 },
		height = { min = 1, max = 0.6 },
		style = "fancy",
		top_down = true,
		date_format = "%R",
		sort = { "level", "added" },
	},
	picker = {
		enabled = true,
		sources = {
			explorer = {
				layout = {
					layout = {
						position = "right",
						width = 30,
					},
				},
				git_status = true,
				hidden = true,
				ignored = true,
			},
		},
	},
})

-- 8
vim.pack.add({
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },
})

require('grug-far').setup({})

-- 9
vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
})


require('nvim-autopairs').setup({})

-- 10
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require('gitsigns').setup({
	on_attach = function(bufnr)
		local gs = require('gitsigns')
		local opts = { buffer = bufnr }

		vim.keymap.set('n', ']c', function() gs.nav_hunk('next') end, opts)
		vim.keymap.set('n', '[c', function() gs.nav_hunk('prev') end, opts)
		vim.keymap.set('n', '<leader>gp', gs.preview_hunk, opts)
		vim.keymap.set('n', '<leader>gr', gs.reset_hunk, opts)
		vim.keymap.set('n', '<leader>gb', gs.blame_line, opts)
	end,
})

-- 11
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require('nvim-treesitter').setup({
	ensure_installed = { "lua", "svelte", "javascript", "typescript", "html", "css", "php", "go", "python", "rust", "toml", "yaml", "json", "jsonc" },
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- 12
vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/Weissle/persistent-breakpoints.nvim" },
})

local dap = require('dap')
local dapui = require('dapui')
local mason_path = vim.fn.stdpath('data') .. '/mason/packages'

dapui.setup()

vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DiagnosticWarn' })
vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'DiagnosticHint' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticOk', linehl = 'DapStoppedLine' })
vim.fn.sign_define('DapLogPoint', { text = '◉', texthl = 'DiagnosticInfo' })

dap.listeners.after.event_initialized['dapui'] = function() dapui.open() end

require('persistent-breakpoints').setup({ load_breakpoints_event = { 'BufReadPost' } })

-- Adapters (глобально, конфігурації — в .nvim.lua проектів)
dap.adapters.python = {
	type = 'executable',
	command = mason_path .. '/debugpy/venv/bin/python',
	args = { '-m', 'debugpy.adapter' },
}

dap.adapters.delve = {
	type = 'server',
	port = '${port}',
	executable = {
		command = mason_path .. '/delve/dlv',
		args = { 'dap', '-l', '127.0.0.1:${port}' },
	},
}

dap.adapters.php = {
	type = 'executable',
	command = 'node',
	args = { mason_path .. '/php-debug-adapter/extension/out/phpDebug.js' },
}

dap.adapters['pwa-node'] = {
	type = 'server',
	host = 'localhost',
	port = '${port}',
	executable = {
		command = 'node',
		args = { mason_path .. '/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
	},
}

-- 13
vim.pack.add({
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
})

-- 14
vim.pack.add({
	{ src = "https://github.com/rmagatti/auto-session" },
})

require('auto-session').setup({
	suppressed_dirs = { '~/', '~/Downloads', '~/Desktop', '/tmp' },
})
