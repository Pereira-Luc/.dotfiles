local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

-- lazy.nvim
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- Use init for configuration, don't use the more common "config".
      --vim.g['vimtex_view_method'] = 'zathura'
      vim.g['vimtex_view_method'] = 'zathura_simple'
      vim.g['vimtex_quickfix_mode'] = 0
      vim.g['vimtex_mappings_enabled'] = 0
      vim.g['vimtex_indent_enabled'] = 0             -- Auto Indent
      vim.g['tex_flavor'] = 'latex'                  -- how to read tex files
      vim.g['tex_indent_items'] = 0                  -- turn off enumerate indent
      vim.g['tex_indent_brace'] = 0                  -- turn off brace indent
      vim.g['vimtex_context_pdf_viewer'] = 'okular'  -- external PDF viewer run from vimtex menu command
      vim.g['vimtex_log_ignore'] = ({                -- Error suppression:
                                      'Underfull',
                                      'Overfull',
                                      'specifier changed to',
                                      'Token not allowed in a PDF string',
    }) 
    end
  },
  -- Override plugin definition options
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
