# Personalized IDE config for Neovim on Windows

Neovim: ```choco install neovim```  
Used terminal: Windows terminal [downloading](https://www.microsoft.com/store/productId/9N0DX20HK701)  
Used font: Delugia Mono [github](https://github.com/adam7/delugia-code)  
Font install: ```choco install nerd-fonts-delugiamono-complete```  

Ripgrep for telescope: ```choco install ripgrep```  
Python3: ```choco install python3```  

Original template: LunarVim [github](https://github.com/LunarVim/nvim-basic-ide)  

## Install the config

Make sure to remove or move your current `nvim` directory  

```
git clone git@github.com:Xan5/nvim-config.git $HOME/.config/nvim
git clone https://github.com/Xan5/nvim-config.git $HOME/.config/nvim
```

Run `nvim` and wait for the plugins to be installed  

Reopen it after it does it's thing.  

Run `:MasonInstall rust-analyzer codelldb` and wait till installed

```
:checkhealth
```

---

## Additional Plugins

- [Harpoon](https://github.com/ThePrimeagen/harpoon)
- [Undotree](https://github.com/mbbill/undotree)
- [Fugitive](https://github.com/tpope/vim-fugitive)

---

### *Updated for 0.9 NEOVIM*
