{ pkgs, inputs, ... }:
{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  extraConfigVim = "source ~/.vim/common.vim\nlet mapleader = \"<Space>\"\ncolorscheme flexoki-dark";

  colorschemes = {
    modus.enable = true;
  };

  plugins = {
    lsp = {
      enable = true;
      servers =  {
        lua-ls.enable = true;
        clangd.enable = true;
        gopls.enable = true;
        java-language-server.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
	texlab.enable = true;

        pyright.enable = true;
        htmx.enable = true;
        zls.enable = true;

        svelte.enable = true;
        ts-ls.enable = true;
      };

    };
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-p>" = "cmp.mapping.select_prev_item(cmp_select)";
          "<C-n>" = "cmp.mapping.select_next_item(cmp_select)";
        };
      };
    };

    telescope = {
      enable = true;
      keymaps = {
        "<C-p>" = { action = "git_files"; };
        "<leader>pf" = { action = "find_files"; };
        "<leader>fg" = { action = "live_grep"; };
      };
    };

    vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull;
    };

    fugitive.enable = true;
    gitsigns.enable = true;
    emmet.enable = true;
  };

  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
    name = "flexoki-neovim";
    src = pkgs.fetchFromGitHub {
      owner = "Francisco-Galindo";
      repo = "flexoki-neovim";
      rev = "0757646cb2e646e715d82e10df47657c9ef03408";
      hash = "sha256-VAasFvYM7emw26nrI/G5Aktcqfi29FEeH0d1PCucNz4=";
    };
})];
}
