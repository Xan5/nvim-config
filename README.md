# Personalized IDE config for Neovim on Windows

Neovim: ```choco install neovim```  
Used terminal: Windows terminal [downloading](https://www.microsoft.com/store/productId/9N0DX20HK701)  
Used font: Delugia Mono [github](https://github.com/adam7/delugia-code)  
Font install: ```choco install nerd-fonts-delugiamono-complete```  

Ripgrep for telescope: ```choco install ripgrep```  
Python3: ```choco install python3```  

Used templates:
- LunarVim [github](https://github.com/LunarVim/nvim-basic-ide)  
- Kickstarter [github](https://github.com/nvim-lua/kickstart.nvim)  

## Install the config
Set needed env variables in powershell

```
$env:HOME=C:\Users\{username}
$env:XDG_CONFIG_HOME=C:\Users\{username}\.config
```

Make sure to remove or move your current `nvim` directory  

```
git clone git@github.com:Xan5/nvim-config.git $HOME/.config/nvim
git clone https://github.com/Xan5/nvim-config.git $HOME/.config/nvim
```

Run `nvim` and wait for the plugins to be installed  

Reopen it after it does it's thing.  

Run `:MasonInstall zls rust-analyzer codelldb` and wait till installed

For undotree to work you need to run `curl -LO https://github.com/neovim/deps/raw/21c5e8bdda33521a6ed497b315e03265a2785cbc/opt/diff.exe` inside neovim/bin

```
:checkhealth
```

---

### *Updated for 0.10.1 NEOVIM*
