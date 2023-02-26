local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.ensure_installed({
    'bashls', 
    'clangd', 
    'cmake',
})

-- Fix undefined global 'vim'
lsp.configure('lua-language-server', {
    setting = {
        Lua = {
            diagnostic = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mappings = cmp_mappings,
})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warning = 'W',
        info = 'I',
        hint = 'H',
    }
})

lsp.setup()

