-- function with all the mappings
local custom_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set('n', 'gr', vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, {buffer=0})
    vim.keymap.set('n', '<space>de', vim.diagnostic.open_float, {buffer=0})
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set('n', '<space>dq', vim.diagnostic.setloclist, {buffer=0})
end

-- gopls lsp
require('lspconfig').gopls.setup{
    on_attach = custom_attach,
}

-- python lsp
require('lspconfig').pyright.setup{
    on_attach = custom_attach,
}
