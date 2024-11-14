{ pkgs, inputs, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./lsp.nix
    ./undotree.nix
    ./ftplugin/default.nix
    ./base16.nix
    ./performance.nix
  ];

  globals.mapleader = " ";

  opts = {
    updatetime = 200;
    encoding = "utf-8";
    fileformat = "unix";
    mouse = "a";

    number = true;
    relativenumber = true;

    autoindent = true;
    smartindent = true;

    signcolumn = "yes";
    colorcolumn = "80";

    ignorecase = true;
    incsearch = true;
    smartcase = true;
    wildmode = "list:longest";
    wildignorecase = true;

    termguicolors = true;
  };

  plugins = {
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

    gitsigns = {
      enable = true;
      settings = {
        trouble = true;
      };
    };

    fugitive.enable = true;

    emmet.enable = true;
    treesitter.enable = true;

    comment = {
      enable = true;
      settings = {
        pre_hook = "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
      };
    };
    ts-context-commentstring.enable = true;

    web-devicons.enable = true;
    trouble.enable = true;
    harpoon.enable = true;
  };

  extraPlugins = [
    pkgs.vimPlugins.vim-svelte
    (pkgs.vimUtils.buildVimPlugin {
      name = "img-paste";
      src = pkgs.fetchFromGitHub {
        owner = "img-paste-devs";
        repo = "img-paste.vim";
        rev = "787be15ff52ea2db5ae7b813ab8808c8d4cf749e";
        hash = "sha256-LaqEGKbpZmcOJeIz00Ts5DvbFnduScBEUnisTcX1srI=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "img-paste";
      src = pkgs.fetchFromGitHub {
        owner = "img-paste-devs";
        repo = "img-paste.vim";
        rev = "787be15ff52ea2db5ae7b813ab8808c8d4cf749e";
        hash = "sha256-LaqEGKbpZmcOJeIz00Ts5DvbFnduScBEUnisTcX1srI=";
      };
    })
  ];

}
