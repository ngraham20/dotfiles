### XSessions
- Make a symbolic link from `.dotfiles/X11/xmonad.desktop` to `/usr/share/xsessions/xmonad.desktop`

### Fonts
The community QTile version of EndeavourOS does not have all the fonts necessary to use `Starship` or even `Discord`. You will need to install `noto-fonts`, `noto-fonts-emoji`, and `noto-fonts-extra`. Optionally `noto-fonts-cjk` for east Asian characters as well.
On the desktop, I have been using NotoSansMonoBold

### Installation
This will eventually be automated, but for now, make sure the following files are copied into their proper places, and symlinks are created.

- `cp udev/99-lobat.rules /etc/udev/rules.d/`
- `cp X11/40-touchpad.conf /etc/X11/xorg.conf.d/`
- `cp X11/xmonad.desktop /usr/share/xsessions/`
- `ln -s $HOME/.dotfiles/X11/.xsession $HOME`
- `ln -s $HOME/.dotfiles/xmonad/xmonad.hs $HOME/.config/xmonad/`
- `ln -s $HOME/.dotfiles/starship.toml $HOME/.config/`
- `ln -s $HOME/.dotfiles/picom/picom.conf $HOME/.config/picom/`


### Lockscreen
To get the lockscreen to trigger on suspend, install `xss-lock` and run it from .xsession (my .xsession already has this)

### Power Management
The `udev` rule will suspend the system when battery level is between 0 and 5% battery

The program `auto-cpufreq (AUR)` is an automatic CPU speed and power optimizer for Linux based on active monitoring of laptop's battery state, CPU usage, CPU temperature and system load.

An alternative to `auto-cpufreq` would be `power-profiles-daemon`, which would allow manual choice between performance modes. This option may be preferable. **THIS IS AWESOME**

`power-profiles-daemon (powerprofilesctl)` is what comes with `qtile`, so it's already installed on EndeavourOS. The command `powerprofilesctl` can get, set, and *temporarily change profiles for the duration of a program*

### Screenshots
`Flameshot` is awesome

### picom
the version of picom that I use is https://github.com/jonaburg/picom

### Audio Management
`$ easyeffects --gapplication-service & disown`
### wmctrl
`wmctrl` is a program that makes workspaces work in bars
