# Mr F's dotfiles

This repository is for my personal computer. They are customised specifically for **macOS**, but you can edit them as you see fit.

## Tools

I like to use package managers for most applications and settings, and rely heavily upon them, particularly:

- [Homebrew](https://brew.sh) - For installing pretty much everything including command line tools and desktop applications
- [asdf](https://asdf-vm.com/) - For managing multiple runtime environments (node, ruby, dart etc...)

### Installation
`$ ./install.sh`

[![asciicast](https://asciinema.org/a/Ix2ZHryGg7JofmG3oQyS0XjPE.svg)](https://asciinema.org/a/Ix2ZHryGg7JofmG3oQyS0XjPE)

### Command line tools included

I have found and used modern replacements for many command line tools, mainly because I prefer the user experience and usability.

These are all installed via Homebrew.


```
  ▓▓▓▓▓▓▓▓▓▓
 ░▓ About  ▓ macOS configuration files
 ░▓ Author ▓ Mr F. <https://git.io/D>
 ░▓ Code   ▓ git@github.com:Demwunz/dotfiles.git
 ░▓▓▓▓▓▓▓▓▓▓
 ░░░░░░░░░░

 bat        > A cat(1) clone with wings.
 exa        > exa is a replacement for ls written in Rust.
 fzf        > fzf is a general-purpose command-line fuzzy finder.
 fd         > A simple, fast and user-friendly alternative to find 
 fx         > Command-line tool and terminal JSON viewer
 gh         > A command-line tool that makes git easier to use with GitHub. 
 httpie     >  Modern command line HTTP client – user-friendly curl alternative with intuitive UI...
 lf         > lf (as in "list files") is a terminal file manager written in Go. 
 jq         > jq is like sed for JSON data
 ripgrep    > ripgrep recursively searches directories for a regex pattern
 thefuck    > Magnificent app which corrects your previous console command.
 zsh        > customised setup via zinit and p10k
 ```

### Command prompt themes

If I decide to switch from ZSH to BASH shell.

ZSH managed via [zinit](https://github.com/zdharma/zinit) - Ultra-flexible and fast Zsh plugin manager
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

## Contribute
This repository has my dotfiles, but if you find a repo or something to improve, feel free to make a pull request to help me to improve my environment!

## License
This repository is released under the MIT license. See LICENSE file for more information.

## Credit

Heavily customised and stolen ideas from loads of repos
