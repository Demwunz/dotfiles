# Mr F's dotfiles

This repository is for my personal computer. They are customised specifically for **macOS**, but you can edit them as you see fit.

## Tools

I like to use package managers for most applications and settings, and rely heavily upon them, particularly:

- [Homebrew](https://brew.sh) - For installing pretty much everything including command line tools and desktop applications
- [asdf](https://asdf-vm.com/) - For managing multiple runtime environments (node, ruby, dart etc...)
- [Zplugin](https://github.com/zdharma/zplugin) - For installing and managing my ZSH installation.

## Usage
In order to use the dotfiles. there are several shell scripts included.

I use a `Brewfile` to keep a track of all of the taps and casks for Homebrew. To export them I used `brew bundle dump`

### Installation
To install the software, asdf and sync the configuration, there is a script called `bin/install.sh` that executes relevant commands.

### Command line tools included

I have found and used modern replacements for many command line tools, mainly because I prefer the user experience and usability.

These are all installed via Homebrew.

- [bat](https://github.com/sharkdp/bat) - A `cat(1)` clone with wings. 
- [exa](https://github.com/ogham/exa) - `exa` is a replacement for `ls` written in Rust.
- [fzf](https://github.com/junegunn/fzf) - `fzf` is a general-purpose command-line fuzzy finder.
- [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to `find` 
- [fx](https://github.com/antonmedv/fx) - Command-line tool and terminal JSON viewer
- [ripgrep](https://github.com/BurntSushi/ripgrep) - ripgrep recursively searches directories for a regex pattern
- [httpie](https://github.com/jakubroztocil/httpie) - Modern command line HTTP client – user-friendly curl alternative with intuitive UI...
- [hub](https://github.com/github/hub) - A command-line tool that makes git easier to use with GitHub. 
- [jq](https://github.com/stedolan/jq) - `jq` is like `sed` for JSON data
- [thefuck](https://github.com/nvbn/thefuck) - Magnificent app which corrects your previous console command.


### Command prompt themes

If I decide to switch from ZSH to BASH shell.

ZSH prompt is [powerlevel10k](https://github.com/romkatv/powerlevel10k) - A fast reimplementation of Powerlevel9k ZSH theme

BASH prompt is [starship](https://starship.rs/) - Rust powered customizable cross-shell prompt

## asdf plugins

I use asdf to manage my runtime environments, it's easy and takes away a lot of pain.
These are the [plugins](https://github.com/asdf-vm/asdf-plugins) I have installed: 

- [dart](https://github.com/PatOConnor43/asdf-dart)
- [elixir](https://github.com/asdf-vm/asdf-elixir.git;)
- [erlang](https://github.com/asdf-vm/asdf-erlang.git;)
- [nodejs](https://github.com/asdf-vm/asdf-nodejs.git;)
- [ruby](https://github.com/asdf-vm/asdf-ruby.git;)

### Aliases

I've only used a few custom aliases which you can see in `.aliases` 

The most notable is `alias ls='exa'` and various variations of it eg `alias ll='exa --long --git --header'`.

### OSX settings

The OSX settings can be found in [`bin/osx_defaults.sh`, run it after you've customised it or just `sh bin/osx_defaults.sh` 

## Contribute
This repository has my dotfiles, but if you find a repo or something to improve, feel free to make a pull request to help me to improve my environment!

## License
This repository is released under the MIT license. See LICENSE file for more information.

## Credit

Heavily customised from upon [https://github.com/rkalis/dotfiles](https://github.com/rkalis/dotfiles)