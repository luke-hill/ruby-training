# Ruby Training

## Dependencies

### Dependency installation on mac

```shell
 # Install brew from http://brew.sh/
 $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 $ brew doctor
 $ xcode-select --install
 $ brew update
 $ brew install git
 $ git --version # This should output a number
 $ curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
 # Quit the terminal once this has installed, and restart your machine
 $ type rvm | head -1
 $ rvm -v # This should output a number
 $ rvm install 2.5.8
 $ rvm install 2.7.1
```

### Dependency installation on ubuntu

```shell
  $ sudo apt-get install git
  $ sudo apt-get install software-properties-common
  $ sudo apt-add-repository -y ppa:rael-gc/rvm
  $ sudo apt-get update
  $ sudo apt-get install rvm
  # In terminal, click Edit > Profile Preferences, click on Title and Command tab and check Run command as login shell.
  # Restart your terminal completely, and restart your machine
  $ rvm -v # This should output a number
  $ rvm install 2.5.8
  $ rvm install 2.7.1
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

It will be the aim that a mixture of theory and discussion will take place for each exercise, and then self-study / exercise completion.

It is advised that each pupil will start with a clean copy of this repo on their machine, and by the
end will have as close to a full completed copy.

When you want to save your work, stage and commit changes:

```bash
$ git checkout -b my_first_branch
$ git add . # the dot is important
$ git commit -m "Explain your change - try be descriptive"
```

When we start working on a new exercise - or are moving forwards with this
problem, save your work as described above, and then make a Pull Request to your own fork.

Doing this will give you a backup of all of your work, and also allow you to track your changes
over time to see how you are progressing.

```bash
# On your current branch
$ git push -u origin <name_of_branch>
$ git checkout master
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

Then throw away the changes:

```bash
$ git reset --hard HEAD
```

You will find you are back at clean directory, where you last committed.

### Did you commit to master by mistake?

Make a branch to keep all your changes:

```bash
git branch my-working-branch
```

Make sure you've got the latest version from GitHub

```bash
git fetch origin
```

Then tell git to create a new copy of master, throwing away the old one:

```bash
$ git reset --hard origin/master
```
