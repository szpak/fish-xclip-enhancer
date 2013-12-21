# Shortcut functions that simplify usage of xclip in Fish Shell

[xclip](https://sourceforge.net/projects/xclip/) is a command line interface to the X.Org clipboard.
`cb` and friends are the wrapper functions that provide a nicer way to use xclip in [Fish Shell](http://fishshell.com/).

The enhanced version:

 - uses "normal" clipboard (XA_CLIPBOARD) not XA_PRIMARY (paste with a middle mouse button)
 - handles input via pipe or parameters
 - can read the content of a file when given
 - prints an excerpt of the content that was copied

## Examples

```
$ tail -n 100 /opt/tomcat/log/catalina.out | cb
Copied to clipboard: 2013-12-18 14:54:57 org.apache.catalina.core.AprLifecycleListener init INFO:...
```

```
$ cbwd
Copied to clipboard: /home/foo/very/long/path/to/some/interesting/place
```

```
$ cbf ~/id_rsa2.pub
Copied to clipboard: ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3KFcRY/SswNVoTvwN1CPZ89Gwwkl5z+XlNk2adYi0rX4...
```

```
$ cb Copy this to a clipboard
Copied to clipboard: Copy this to a clipboard
```

## Installation

### Manual version

Download `cb.fish` and put it into `~/.config/fish/functions/` directory.

**Append** a content of `companionFunctions.txt` to the `~/.config/fish/config.fish` file
(in Fish only one function can be defined in a dedicated function file).

### Scripted version

```
curl -o ~/.config/fish/functions/cb.fish https://raw.github.com/szpak/fish-xclip-enhancer/master/cb.fish
curl https://raw.github.com/szpak/fish-xclip-enhancer/master/companionFunctions.txt >> ~/.config/fish/config.fish
```

## Authors

The original idea and implementation for Bash was written by [Nathan Broadbent](http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/).

The script was ported to Fish by [Marcin Zajączkowski](http://blog.solidsoft.info/).

The Fish version is licensed under the terms of [the Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0.txt).
