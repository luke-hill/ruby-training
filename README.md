# Ruby Training

## Dependencies

### Dependency installation on mac

NB: These are partially based on the setup instructions found here:
https://github.com/luke-hill/setup_info/blob/main/mac_setup.md

```bash
# Install brew from http://brew.sh/
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew doctor
$ softwareupdate --all --install --force
$ sudo xcode-select --install
$ brew update
$ brew upgrade
$ brew install git
$ git --version # This should output a number
# If running on Big Sur - Uncomment the next lines and run them
# $ export warnflags=-Wno-error=implicit-function-declaration
# $ softwareupdate --install-rosetta
$ curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
$ rvm update
$ rvm reload
# Quit the terminal once this has installed, and restart your machine
$ type rvm | head -1
$ rvm -v # This should output a number
$ rvm install 2.7.4
$ rvm install 3.0.2
```

### Dependency installation on ubuntu

NB: These are partially based on the setup instructions found here: 
https://github.com/luke-hill/setup_info/blob/main/setup.md

```bash
$ sudo apt-get install git
$ sudo apt-get install gnome-tweak-tool libappindicator1 software-properties-common curl perl gcc --fix-missing -y
$ sudo apt-get install libcurl3-gnutls libcurl4-openssl-dev libcurl4 libgmp3-dev libpq-dev libmagic-dev libssl1.0-dev --fix-missing -y
$ sudo apt-add-repository -y ppa:rael-gc/rvm
$ sudo apt-get update
$ sudo apt-get install rvm
$ source /etc/profile.d/rvm.sh
$ rvm fix-permissions system
$ rvm group add rvm $USER
$ rvm autolibs disable
$ rvm update
$ rvm reload
# In terminal, click Edit > Profile Preferences, click on Title and Command tab and check Run command as login shell.
# Restart your terminal completely, and restart your machine
$ rvm -v # This should output a number
$ rvm install 2.7.4
$ rvm install 3.0.2
```

## Setup

Fork this repository to your own workspace, and then clone it

```bash
# Fork it
$ git clone git@github.com:<your-gh-username>/ruby-training.git
```

Change directories so that you're in the project:

```bash
$ cd ruby-training
```

## Exercises

The classes are split into a variety of technical challenges.
 
The folders will consist of various exercises, which are split according to week and complexity.
 
Each exercise will be in a subfolder of this directory, and should contain a README with more information.

It will be the aim that a mixture of theory and discussion will take place for each exercise, and then
self-study / exercise completion.

It is advised that each pupil will start with a clean copy of this repo on their machine, and by the
end will have as close as possible; to a full completed copy.

When you want to save your work, stage and commit changes:

```bash
$ git add . # the dot is important
$ git commit -m "Explain your change - try be descriptive"
```

> (Ensure you are working on a branch to start with and **not main**).

When we start working on a new exercise - or are moving forwards with a specific
problem, save your work as described above, and then make a Pull Request to your own fork.

Doing this will give you a backup of all of your work, and also allow you to track your changes
over time to see how you are progressing.

```bash
# On your current branch
$ git push -u origin <name_of_branch>
$ git checkout main
# Make the requisite PR on github and merge
$ git pull -p # the -p is optional but just helps tidy up the branch
# Then create a new branch straight away to continue working, with the latest changes you made
$ git checkout -b <new_branch_name>
```

## Git: Troubleshooting / Recovery

### Throw it all away

If you have gone down a blind alley, and you just want to start over, git makes
it easy to clean up and start again.

First of all make sure git knows about all of your files:

```bash
$ git add .
```

Then throw away all of the changes:

```bash
$ git reset --hard HEAD
```

You will find you are back at a clean directory, from when you last committed.

### Did you commit to main by mistake?

Make a branch to keep all your changes:

```bash
git branch my-working-branch
```

Make sure you've got the latest version from GitHub

```bash
git fetch origin
```

Then tell git to create a new copy of main, throwing away the old one:

```bash
$ git reset --hard origin/main
```
