require("set")
require("remap")

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
	    '--branch=stable', -- latest stable release
        lazypath,
    }
end

vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup('plugins', {
    defaults = {
        lazy = false
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    checker = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                -- 'matchit',
                -- 'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
                'Copilot',
            },
        },
    },
})

vim.cmd("Copilot disable")


