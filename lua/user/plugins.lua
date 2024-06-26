local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-ts-autotag"
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "karb94/neoscroll.nvim"
  use "folke/todo-comments.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use 'rktjmp/lush.nvim'
  use {'catppuccin/nvim', as = "catppuccin", run = "CatppuccinCompile"}
  use "projekt0n/github-nvim-theme"
  use "rose-pine/neovim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use { "williamboman/mason.nvim" } -- Package Manager.
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "nvimtools/none-ls.nvim" -- for formatters and linters
  use { "nvimtools/none-ls-extras.nvim", requires = { "nvimtools/none-ls.nvim" } }
  use "j-hui/fidget.nvim"
  use "simrat39/symbols-outline.nvim"
  use 'ray-x/lsp_signature.nvim'
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }

  -- Debugger.
  use "mfussenegger/nvim-dap"
  use "mfussenegger/nvim-dap-python"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Movement
  use 'phaazon/hop.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Documentation
  use {
    "danymat/neogen",
    config = function()
        require('neogen').setup({})
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }

  -- Colors :)
  use 'norcalli/nvim-colorizer.lua'

  -- Markdown preview.
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


  -- Lines for colored lines modes.
  use({
    'mvllow/modes.nvim',
    config = function()
        require('modes').setup({
                colors = {
                    delete = "#f70067",
                    insert = "#d89aff",
                    visual = "#ae72f7"
                }
        })
    end
  })

  -- nvim repl
  use {'Vigemus/iron.nvim'}

  -- nvim notify
  use {"rcarriga/nvim-notify"}
  use {"MunifTanjim/nui.nvim"}
  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  })

  -- Copilot stuff.
 use {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "VimEnter",
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
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup({
  formatters = {
    label = require("copilot_cmp.format").format_label_text,
    insert_text = require("copilot_cmp.format").format_insert_text,
    preview = require("copilot_cmp.format").deindent,
  },
})
    end
  }

  -- Packer
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
