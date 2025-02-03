-- signature_help_window_opened = false
-- signature_help_forced = false
-- function my_signature_help_handler(handler)
--     return function (...)
--         if _G.signature_help_forced and _G.signature_help_window_opened then
--             _G.signature_help_forced = false
--             return handler(...)
--         end
--         if _G.signature_help_window_opened then
--             return
--         end
--         local fbuf, fwin = handler(...)
--         _G.signature_help_window_opened = true
--         vim.api.nvim_exec("autocmd WinClosed "..fwin.." lua _G.signature_help_window_opened=false", false)
--         return fbuf, fwin
--     end
-- end

-- function force_signature_help()
--     _G.signature_help_forced = true
--     vim.lsp.buf.signature_help()
-- end

-- -- These mappings allow to focus on the floating window when opened.
-- buf_set_keymap('n', '<C-k>', '<cmd>lua force_signature_help()<CR>', opts)
-- buf_set_keymap('i', '<C-k>', '<cmd>lua force_signature_help()<CR>', opts)

-- -- Replacing the handler with my own, which manage the floating window.
-- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
--     my_signature_help_handler(vim.lsp.handlers.signature_help),
--     {}
-- )
-- -- All from https://neovim.discourse.group/t/show-signature-help-on-insert-mode/2007/4

