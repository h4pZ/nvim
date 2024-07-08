return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier"
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "configs.nvim-tree"
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "configs.project"
    end,
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = { "all", },
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "python"
      },
    },
  },
  -- My plugins
  {
    "folke/which-key.nvim",
    config = function()
      require "configs.which-key"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "configs.telescope"
    end,
  },

  {
    "Vigemus/iron.nvim",
    lazy = true,
    config = function()
      require "configs.iron"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require "configs.dap"
    end,

  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = false,
    config = function()
      require "configs.dap-python"
    end,
  },

  { "nvim-neotest/nvim-nio" },

  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    config = function()
      require "configs.dap-ui"
    end,
  },

  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    version = "*",
    lazy = true,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    lazy = true,
  },

  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      require "configs.hop"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    lazy = false,
    config = function()
      require('copilot').setup({
        panel = {
          enabled = false,
          auto_refresh = true,
          keymap = {
            accept = "<CR>",
            jump_prev = "[[",
            jump_next = "]]",
            refresh = "gr",
            open = "<M-CR>",
          },
        },
        suggestion = {
          enabled = false,
          auto_trigger = true,
          keymap = {
            accept = "<M-l>",
            prev = "<M-[>",
            next = "<M-]>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    lazy = false,
    config = function()
      require("copilot_cmp").setup({
        formatters = {
          label = require("copilot_cmp.format").format_label_text,
          insert_text = require("copilot_cmp.format").format_insert_text,
          preview = require("copilot_cmp.format").deindent,
        },
      })
    end
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require "configs.neoscroll"
    end
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.todo-comments"
    end,

  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require "configs.nvim-colorizer"
    end,
  },

}
