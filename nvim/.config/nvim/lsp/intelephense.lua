return {
	cmd = { 'intelephense', '--stdio' },
	filetypes = { 'php' },
	root_markers = { 'composer.json', '.git' },
	settings = {
		intelephense = {
			diagnostics = {
				undefinedProperties = false,
				unusedSymbols = false,
			},
		},
	},
}
