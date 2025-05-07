# Welcome to my Arch Linux .dotfiles
This is a repository for some of my configuration files.

## Install
To move those files to your system you first need to clone this repo:

``
 $ git clone https://github.com/unixkiwi/dotfiles.git
``
After that you could move all files by hand, BUT i have a better way for you:
*This repository was made for GNU Stow, a symlink manager.*
To move all files go to the cloned directory and run the following command:

``
  $ cd dofiles
  $ stow .
``

> Please note that this won't work if the target file already exists.
> If you want to merge my files with your files and symlink them run this command:

``
  $ stow . --adopt
``

