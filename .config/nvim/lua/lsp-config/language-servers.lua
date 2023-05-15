-- function with all the mappings
local custom_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "gR", vim.lsp.buf.references, {buffer=0})
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, {buffer=0})
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, {buffer=0})
end

-- gopls lsp
require("lspconfig").gopls.setup{
    on_attach = custom_attach,
    settings = {
        gopls = {
            gofumpt = true,
        }
    }
}

-- python lsp
require("lspconfig").pyright.setup{
    on_attach = custom_attach,
}

-- bash lsp
require("lspconfig").bashls.setup{
    on_attach = custom_attach,
}

-- docker lsp
require("lspconfig").dockerls.setup{
    on_attach = custom_attach,
}

-- terraform lsp
require("lspconfig").terraformls.setup{
    on_attach = custom_attach,
}

-- typescript lsp
require("lspconfig").tsserver.setup{
    on_attach = custom_attach,
}

-- html lsp
require("lspconfig").html.setup {
    on_attach = custom_attach,
}

-- css lsp
require("lspconfig").cssls.setup {
    on_attach = custom_attach,
}

-- json lsp
require("lspconfig").jsonls.setup{
    on_attach = custom_attach,
}
