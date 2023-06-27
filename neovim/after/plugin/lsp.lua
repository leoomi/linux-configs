local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
	'lua_ls',
	-- Go LSPs
	'gopls',
	-- JS/TS
	'tsserver',
	'eslint',
	-- C#,
	'csharp_ls',
	-- 'omnisharp',
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
