## Home Directory Profiles ##

Collection of profiles I find useful for development (particularly Ruby and Python) on Mac OS X.  Sets up aliases, rvm or python prompts, emacs defaults, etc.

Requires [homebrew](https://brew.sh/) and [rvm](https://rvm.io/).

To install, simply clone this repository into your home directory, and invoke the `mk_sym_links.sh` script.

    $ cd
    $ git clone git@github.com:boscomonkey/home-profiles.git
    $ home-profiles/mk_sym_links.sh

The `mk_sym_links.sh` script will create sym-links only if a profile does NOT already exist.  Thus, you may want to move the original to a backup location.

Also, don't forget to edit the [user] section of `gitconfig` to specify your default email and name.


#### Credentials, Proprietary profiles, etc ####

If you have credentials or profile settings that you don't want to inadvertently commit to the repo:

* Create `~/.nocommit_credentials` and put credentials in there (e.g., AWS keys & IDs)
* Create `~/.nocommit_profile` and put your aliases and variables in there.

`bash_profile` will detect these files and source them if found. `.gitignore` lists these files to provide an additional source of protection against committing to your git repo.


#### Ruby or Python ####

When you start a new terminal window, you don't automatically get all the command like goodness that these dotfiles provide. You must use one of these commands:

* `py` for python development
* `rb` for ruby development

If you use one more often than the other, you can set the environment variables `I_LOVE_RUBY` or `I_LOVE_PYTHON` in `~/.nocommit_profile`. Then either `rb` or `py` will be invoked automatically. For example:

    export I_LOVE_RUBY=1

or

    export I_LOVE_PYTHON=1


#### Emacs ####

Since I use Aquamacs a lot, there are some features in this repo that supports it:

* `emacs` (after linking - `.emacs`) config file with my minimal customization
* `aquamacs` alias to open a file in Aquamacs from the command line
* _yaml-mode_ as a git submodule under `emacs.d/yaml-mode`. Run the following command (from the repo directory) to instantiate the directory:
```git submodule update --init --recursive```
