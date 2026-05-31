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
    lazy = false,
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier",
        "pyrefly",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require "configs.nvim-tree"
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require "configs.project"
    end,
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "python",
      },
    },
  },
  -- My plugins
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    "folke/which-key.nvim",
    lazy = false,
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
    "smoka7/hop.nvim",
    lazy = false,
    config = function()
      require "configs.hop"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = true,
    config = function()
      require('copilot').setup({
        autostart = false,
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
    lazy = true,
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

  {
    'mvllow/modes.nvim',
    lazy = true,
    tag = 'v0.2.0',
    config = function()
      require('modes').setup({
        colors = {
          delete = "#f70067",
          insert = "#d89aff",
          visual = "#ae72f7"
        }
      })
    end
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      picker = {
        enabled = true,
        ui_select = true,
      },
      input = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
              ⠀⠀⣀⣤⡤⠀⠀⠀⠀⠀⠀    ⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⠀⢀⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
         ⠀⠀⣠⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⢸⠛⠉⢹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠄⠠⣀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⡘⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⠉⠀⠀⠀⣾⣿⣦⡀⠀⠀⠀⠀⠀
        ⠀⠀⡇⠀⠀⠀⢡⠄⠀⠀⣀⣀⣀⣠⠊⠀⠀⠀⠀⡠⠞⠛⠛⠛⠛⠀⠀⠀⠀⠀
        ⠀⠀⢃⠀⠀⠀⠀⠗⠚⠉⠉⠀⠈⠁⠀⠀⠀⢀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣄⠲⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠃⠀⠀⢠⣤⡀⠀⠀⠀⠀⣿⣿⣿⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⡆⠀⠀⣿⣿⡇⠀⠀⠀⠀⠈⠛⠉⣴⣆⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⣇⢰⡧⣉⡉⠀⠀⢀⡀⠀⣀⣀⣠⣿⡷⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⢻⠘⠃⠈⠻⢦⠞⠋⠙⠺⠋⠉⠉⠉⢡⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠳⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀
        ⠀⠀⠀⠀⠀⠀⠈⠁⢲⡄⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⣀⣤⣴⣶⣿⣿⣿⣿⡇
          ⠀⠀⠀⠀⠀⡰⠋⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃
         ⠀⠀⠀⠀⢀⡞⠁⠀⠀⣾⠀⠀⣶⠀⠀⠀⢸⣦⣴⣿⣿⣿⠛⠉⠉⠉⠉⠁⠀
        ⠀⠀⢀⣀⡰⠏⠀⠀⠀⠀⠉⠀⠈⠋⠀⠀⠀⠘⣿⣿⣿⠛⠋⠀⠀⠀⠀⠀⠀⠀
        ⠰⣮⣉⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⡋⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠈⠉⠻⠥⠤⢤⣶⢄⠀⢀⣠⣄⠀⠀⢠⣶⣤⣄⠈⠑⡄⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠈⠋⠁⠠⠁⠀⠈⠁⠀⠀⠀⠀⠀⠀     
                                      
              『ミミッキュ』          
]]         ,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = " ", key = "P", desc = "Projects", action = ":Telescope projects" },
            { icon = "󰈚 ", key = "o", desc = "Recent Files", action = ":Telescope oldfiles" },
            { icon = "󰈭 ", key = "w", desc = "Find Word", action = ":Telescope live_grep" },
            { icon = " ", key = "a", desc = "Bookmarks", action = ":Telescope marks" },
            { icon = " ", key = "h", desc = "Themes", action = ":Telescope themes" },
            { icon = "󰩈 ", key = "q", desc = "Quit", action = ":q" },
          }
        }
      },
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  { "nvzone/volt", lazy = true },

  { "nvzone/minty", cmd = { "Shades", "Huefy" }, },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
    config = function()
      require "configs.copilot-chat"
    end,

  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    config = function()
      require "configs.render-markdown"
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    lazy=false,
    version = "*",
    config = function()
        require "configs.toggle-term"
    end
  },
  {
    'stevearc/aerial.nvim',
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    lazy = false,
    dependencies = {
      'kevinhwang91/promise-async'
    },
    config = function()
      require "configs.ufo"
    end,
  }
}
