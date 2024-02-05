local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/Users/harry/.local/share/nvim/site/pack/packer/start/packer.nvim"
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

return packer.startup(function(use)                                   --| Plugins: 
	use("wbthomason/packer.nvim")                                       --| Have packer manage itself
  use("nvim-lua/plenary.nvim")                                        --| Lua functions that many plugins use
  use("bluz71/vim-nightfly-guicolors")                                --| Colorscheme
  use("szw/vim-maximizer")                                            --| Maximize & restore current window
  use("christoomey/vim-tmux-navigator")                               --| Split window navigation
  use("tpope/vim-surround")                                           --| Essential plugin
  use("vim-scripts/ReplaceWithRegister")                              --| Essential plugin
  use("numToStr/Comment.nvim")                                        --| Commenting with gc
  use("nvim-tree/nvim-tree.lua")                                      --| File explorer
  use("kyazdani42/nvim-web-devicons")                                 --| Icons
  use("nvim-lualine/lualine.nvim")                                    --| Statusline
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })   --| Dependency for Telescope
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })          --| Telescope
  use("hrsh7th/nvim-cmp")                                             --| Nvim autocomplete
  use("hrsh7th/cmp-buffer")                                           --| Nvim autocomplete engine
  use("hrsh7th/cmp-path")                                             --| Nvim autocomplete
  use("L3MON4D3/LuaSnip")                                             --| Snippet Engine
  use("saadparwaiz1/cmp_luasnip")                                     --| Snippet Source
  use("rafamadriz/friendly-snippets")                                 --| Collection of useful snippets
  use("williamboman/mason.nvim")                                      --| Managing & installing lsp servers
  use("williamboman/mason-lspconfig.nvim")                            --| Lsp config
  use("neovim/nvim-lspconfig")                                        --| Configuring lsp servers
  use("hrsh7th/cmp-nvim-lsp")                                         --| Configuring lsp servers
  use({ "glepnir/lspsaga.nvim", branch = "main" })                    --| Lsp GUI
  use("onsails/lspkind.nvim")                                         --| Add vscode-like icons to autocompletion window
  use("jose-elias-alvarez/null-ls.nvim")                              --| Formatting & linting
  use("jayp0521/mason-null-ls.nvim")                                  --| Configuring formatting & linting
  use("lewis6991/gitsigns.nvim")                                      --| Git signs

	if packer_bootstrap then
		require("packer").sync()
	end
end)
