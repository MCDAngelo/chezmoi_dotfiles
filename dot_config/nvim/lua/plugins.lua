return {
    -- Drawers
    'roman/golden-ratio',
    'itchyny/lightline.vim',
    -- TODO: Reset theming for lightline
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- Themeing
    -- 'RRethy/base16-nvim',
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    -- Tim Pope extravaganza
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'tpope/vim-commentary',
    'tpope/vim-abolish',
    'tpope/vim-fugitive',
    'tpope/vim-projectionist',
    'github/copilot.vim',

    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter.configs',
    -- "HiPhish/nvim-ts-rainbow2",
    "HiPhish/rainbow-delimiters.nvim",
     {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function ()
          require('nvim-ts-autotag').setup({
            -- your config
            enable = true,
            filetypes = {
            'html', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
            'css', 'lua', 'xml', 'php', 'markdown', 'typescript.tsx', 'python', 'ruby', 
            }
          })
        end,
        lazy = false,
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },

    -- Autocompletion
    'hrsh7th/cmp-buffer',
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {
                'saadparwaiz1/cmp_luasnip',
            },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            -- local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                -- mapping = cmp.mapping.preset.insert({
                --     ['<C-Space>'] = cmp.mapping.complete(),
                --     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                --     ['<C-d>'] = cmp.mapping.scroll_docs(4),
                --     ['<C-n>'] = cmp_action.luasnip_jump_forward(),
                --     ['<C-p>'] = cmp_action.luasnip_jump_backward(),
                -- })
            })
        end
    },
    {
        'tzachar/cmp-ai',
        dependencies = 'nvim-lua/plenary.nvim'
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'jay-babu/mason-null-ls.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
                if client.name == 'ruff_lsp' then
                    -- Disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                end
            end)

            lsp_zero.format_on_save({
                format_opts = {
                    async = true,
                    timeout_ms = 10000,
                },
                servers = {
                    ['null-ls'] = { 'javascript', 'typescript', 'typescriptreact', 'jsx', 'css', },
                    ['ruff-lsp'] = { 'python' },
                },
            })

            require('mason').setup({})
            require('mason-lspconfig').setup({
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    'hrsh7th/cmp-nvim-lsp-signature-help',
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {},
      config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    -- {
    --     'mfussenegger/nvim-lint',
    --     config = function()
    --         require("lint").linters_by_ft = {
    --             htmldjango = { "djlint" },
    --         }
    --     end,
    -- },

    -- Move around
    'christoomey/vim-tmux-navigator',
    'christoomey/vim-tmux-runner',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Langs
    'jjo/vim-cue',
    'MaxMEllon/vim-jsx-pretty',
    'jose-elias-alvarez/typescript.nvim',

    -- Git Stuff
    'lewis6991/gitsigns.nvim',

   -- HTML autcomplete tags
    -- require('windwp/nvim-ts-autotag').setup({
    --     opts = {
    --         -- Defaults
    --         enable_close = true, -- Auto close tags
    --         enable_rename = true, -- Auto rename pairs of tags
    --         enable_close_on_slash = false -- Auto close on trailing </
    --       },
    --       -- Also override individual filetype configs, these take priority.
    --       -- Empty by default, useful if one of the "opts" global settings
    --       -- doesn't work well in a specific filetype
    --       -- per_filetype = {
    --       --   ["html"] = {
    --       --     enable_close = false
    --       --   }
    --     -- }
    -- })
}
