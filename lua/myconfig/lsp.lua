local lspconfig = require("lspconfig")

-- Get capabilities from Blink's CMP setup
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Setup your servers with capabilities
lspconfig.tsserver.setup({
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
})

lspconfig.html.setup({
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    capabilities = capabilities,
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
})

lspconfig.pyright.setup({
    capabilities = capabilities,
})
