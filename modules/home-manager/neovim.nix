{ config, pkgs, inputs, ...}:

{
  
  home.packages = with pkgs; [
    lua-language-server
    rnix-lsp
    rust-analyzer

    xclip
    wl-clipboard
  ];

  nixpkgs = {
    overlays = [
      ( final: prev: {
        vimPlugins = prev.vimPlugins // {
          harpoon2-nvim = prev.vimUtils.buildVimPlugin {
            name = "harpoon2";
            src = inputs.plugin-harpoon2;
          };
        };
      })
    ];
  };
  
programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp
      rust-analyzer

      xclip
      wl-clipboard
      ripgrep
      fd
    ];

    plugins = with pkgs.vimPlugins; [

      {
        plugin = neodev-nvim;
        config = toLua "require(\"neodev\").setup()";
      }
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }

      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/plugin/cmp.lua;
      }
      cmp-nvim-lsp

      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/plugin/telescope.lua;
      }
      plenary-nvim
      telescope-fzf-native-nvim
      {
        plugin = harpoon2-nvim;
        config = toLuaFile ./nvim/plugin/harpoon.lua;
      }

      {
        plugin = lualine-nvim;
        config = toLuaFile ./nvim/plugin/lualine.lua;
      }

      friendly-snippets

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-rust
          p.tree-sitter-java
        ]));
        config = toLuaFile ./nvim/plugin/treesitter.lua;
      }

      {
        plugin = gitsigns-nvim;
        config = toLua "require(\'gitsigns\').setup()";
      }

      # Language support
      luasnip
      vim-nix
      cmp_luasnip
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';

  };
}
