##Configuration files for various utilities
This is a set of configuration files I have gathered over time.

Includes files for **Vim**, Bash, Zsh, Screen.

-------------------
###Installation
    $ sh ./install.sh

Then follow the prompts.


----------
### Vim 
Plugins are handled with [**Vundle**](https://github.com/gmarik/vundle):

 * To add a new plugin just add the github path in the Vundle section of *.vimrc*
 * To install plugins after editing *.vimrc* run: `:BundleInstall`. This is run automatically with initial installation.
 * To clean after removing a plugin: `:BundleClean`
 * To see install plugins, use: `:BundleList`

For tag support you are going to need Exuberant tags (*ctags*).

####Haskell
The relevant plugins require `hdevtools`, `ghc-mod` and `lushtags` installed. These can be installed through cabal.

----------
### TODO
 * Something is causing a delay at startup.
