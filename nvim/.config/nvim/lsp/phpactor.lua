return {
	cmd = { 'phpactor', 'language-server' },
	filetypes = { 'php' },
	root_markers = { 'composer.json', '.git' },
	on_attach = function(client)
		-- залишити тільки rename, file operations і sync — решту дає intelephense
		client.server_capabilities.completionProvider = nil
		client.server_capabilities.hoverProvider = nil
		client.server_capabilities.signatureHelpProvider = nil
		client.server_capabilities.definitionProvider = nil
		client.server_capabilities.referencesProvider = nil
		client.server_capabilities.documentHighlightProvider = nil
		client.server_capabilities.documentSymbolProvider = nil
		client.server_capabilities.codeActionProvider = nil
		client.server_capabilities.documentFormattingProvider = nil
		client.server_capabilities.documentRangeFormattingProvider = nil
		client.server_capabilities.diagnosticProvider = nil

		-- ігнорувати діагностику від phpactor
		local original_handler = vim.lsp.handlers['textDocument/publishDiagnostics']
		vim.lsp.handlers['textDocument/publishDiagnostics'] = function(err, result, ctx, config)
			local c = vim.lsp.get_client_by_id(ctx.client_id)
			if c and c.name == 'phpactor' then
				return
			end
			return original_handler(err, result, ctx, config)
		end
	end,
}
