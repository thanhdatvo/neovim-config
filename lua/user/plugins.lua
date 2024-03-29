local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("numToStr/Comment.nvim") -- Easily comment stuff

  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  --[[ use { ]]
  --[[ "nvim-neo-tree/neo-tree.nvim", ]]
  --[[   branch = "v2.x", ]]
  --[[   requires = {  ]]
  --[[     "nvim-lua/plenary.nvim", ]]
  --[[     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended ]]
  --[[     "MunifTanjim/nui.nvim", ]]
  --[[   } ]]
  --[[ } ]]
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/toggleterm.nvim")

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out

  -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig") -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  use({ "jose-elias-alvarez/null-ls.nvim", compile = "76d0573fc159839a9c4e62a0ac4f1046845cdd50" }) -- for formatters and linters
  --76d0573fc159839a9c4e62a0ac4f1046845cdd50

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  -- use 'nvim-telescope/telescope-media-files.nvim'

  -- use "lunarvim/darkplus.nvim"
  use({ "bluz71/vim-nightfly-guicolors" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")

  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("windwp/nvim-ts-autotag")

  -- Git
  use("lewis6991/gitsigns.nvim")

  use("p00f/nvim-ts-rainbow")
  use("nvim-treesitter/playground")

  use("lewis6991/impatient.nvim") -- speed up neovim

  use("mfussenegger/nvim-dap")
  use("leoluz/nvim-dap-go")

  use("xiyaowong/nvim-transparent") -- make background transparent


  -- add rust analyzer
  use 'simrat39/rust-tools.nvim'
  
  -- to format golang
  use 'ray-x/go.nvim'
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  use {
  'rmagatti/auto-session',
  --[[ config = function() ]]
  --[[   require("auto-session").setup { ]]
  --[[     log_level = "error", ]]
  --[[     auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"}, ]]
  --[[     post_restore_cmds = {"NvimTreeOpen"} ]]
  --[[   } ]]
  --[[ end ]]
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
