{
  opts = {
    updatetime = 200;
    encoding = "utf-8";
    fileformat = "unix";
    mouse = "a";

    number = true;
    relativenumber = true;

    signcolumn = "yes";
    colorcolumn = "80";
    wrap = false;
    linebreak = false;

    ignorecase = true;
    incsearch = true;
    smartcase = true;
    wildmode = "list:longest";
    wildignorecase = true;

    termguicolors = true;
  };

  extraConfigVim = ''
    autocmd FileType * TSEnable highlight
    autocmd FileType * TSEnable indent
    '';

}
