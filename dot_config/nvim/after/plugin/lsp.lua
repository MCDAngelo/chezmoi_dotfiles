vim.api.nvim_create_augroup('AutoFormatting', {})
-- vim.api.nvim_create_autocmd('BufWritePost', {
--     pattern = { '*.py' },
--     group = 'AutoFormatting',
--     desc = "Auto-format Python files after saving",
--     callback = function()
--         local fileName = vim.api.nvim_buf_get_name(0)
--         vim.cmd(":silent !black --preview -q " .. fileName)
--         vim.cmd(":silent !isort --profile black --float-to-top -q " .. fileName)
--         vim.cmd(":silent !docformatter --in-place --black " .. fileName)
--     end,
-- })
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.py', '*.html', '*.css', '*.md'},
    group = 'AutoFormatting',
    callback = function()
        vim.lsp.buf.format() 
    end,
})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { 'htmldjango' },
    group = 'AutoFormatting',
    callback = function()
        vim.lsp.buf.format() 
    end,
})
vim.api.nvim_create_augroup('Skeletons', {})
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.html',
    group = 'Skeletons',
    command = '0r ~/.config/nvim/skeletons/skeleton.html',
})
vim.api.nvim_create_augroup('Spacing', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'html', 'css', 'htmldjango' },
    group = 'Spacing',
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})
-- vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile', 'BufWritePre'}, {
--     pattern = '*.md',
--     group = 'AutoFormatting',
--     callback = function()
--         vim.opt_local.textwidth = 80
--         vim.
-- })
