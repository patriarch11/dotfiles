vim.lsp.enable({
	"lua_ls",
	"pyright",
	"ruff",
	"gopls",
	"ts_ls",
	"intelephense",
	"phpactor",
	"html",
	"cssls",
	"taplo",
	"yamlls",
	"jsonls",
	"tailwindcss",
	"svelte",
	"rust-analyzer",
	-- "eslint", -- disabled: spams "path must be of type string" errors (vscode-eslint-language-server bug)
})

vim.diagnostic.config({ virtual_text = true })
