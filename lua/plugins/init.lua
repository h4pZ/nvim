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
  			"html-lsp", "css-lsp" , "prettier"
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
    lazy = false,
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
    version = "*"
  },
}
