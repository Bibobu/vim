return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'dense-analysis/ale'
  use {
    "folke/zen-mode.nvim",
     config = function()
     require("zen-mode").setup {
      -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      --
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
      'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}
  }
  use {
      'lervag/vimtex'
  }
  end)
