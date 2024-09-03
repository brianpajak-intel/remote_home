# remote_home
Git repostory of my dotfiles

## Initial setup
1. Identify a writable disk where you have a good amount of storage space and clone this repository to that location with the name ```remote_home```
2. Create a softlink from ```remote_home/bin``` to ```~/bin```
3. Create a softlink from ```remote_home/dotfiles``` to ```~/dotfiles```
4. Create a softlink from ```remote_home/fonts``` to ```~/.local/share/fonts```
5. Add the following to your .cshrc.$USER file (MAKE SURE YOU CHANGE <PATH TO DISK>:
   ```
   ###----->DOTFILE MANAGEMENT<----
   ###
   setenv REMOTE_HOME <PATH TO DISK>/remote_home
   setenv DOTFILES    $REMOTE_HOME/dotfiles
   setenv USER_BIN    $REMOTE_HOME/bin
   setenv PATH        ~/bin:$PATH
   eval `~/bin/oh-my-posh init tcsh --config ~/.mytheme.omp.yaml`
   ```
6. Execute the following commands:
   ```
   alias stow 'stow -d dotfiles -t ~/ '
   alias unstow 'stow -D -d dotfiles -t ~/ '
   ```
7. Source your ```~/.cshrc.$USER```
8. Backup your ```~/.aliases``` file: mv ~/.aliases ~/.aliases.bak
9. Test stow by stowing the prompt and aliases
   ```
   stow prompt
   stow aliases
   stow terminal
   ```
