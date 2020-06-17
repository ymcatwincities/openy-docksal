This is a Docksal-based for the [Open Y](https://github.com/ymcatwincities/openy) Drupal distribution.

[Docksal](https://docksal.io/) is used as a local development environment.

# Get Started

You need to install Docksal on your local machine according to [Docksal setup](http://docksal.readthedocs.io/en/master/getting-started/env-setup/) instructions.

## Full install from scratch

Note: a local instance of PHP and/or Composer is not required.

Follow these steps to get fully prepared project.

#### Install Docksal
```bash
curl -fsSL https://get.docksal.io | bash
```

#### Clone OpenY docksal project
```bash
git clone git@github.com:ymcatwincities/openy-docksal.git
```

#### Add your custom settings

- Create `docksal-local.env` file inside `.docksal` directory with content:
```yaml
OPENY_PROJECT_VERSION='8.2.x-dev'
OPENY_VERSION='8.x-2.x'
GIT_REMOTE_UPSTREAM='git@github.com:USER/openy.git'
IGNORE_CUSTOM='.idea'
```
- Replace `USER` by your user name from github or remove `GIT_REMOTE_UPSTREAM` if you doesn't have fork of `ymcatwincities/openy`
Also you can set here corresponding versions of openy-project and openy.

- During execution of `build_project` command all directories except ignored will be deleted. 
If you work on already existing project and want to save any folder in project root directory - add folder name
to `IGNORE_CUSTOM`. Directories names should be separated by spaces.

If you want to use your fork as an origin remote and the main repository as an 
upstream remote, add the following variables to the `docksal-local.env` file 
as follows:
```yaml
GIT_REMOTE_UPSTREAM='git@github.com:ymcatwincities/openy.git'
GIT_REMOTE_ORIGIN='git@github.com:USER/openy.git'
```
In this case, after project install git will already track the repositories 
you specified as `origin` and `upstream` remotes

#### Build Open Y project
Run this command inside your project directory:
```bash
fin build_project
```
As result you will get full Open Y installation in your file system.

The "Killed" message during command run usually means that you need to increase memory limits in your Docksal.
For macOS or Windows overall memory volume available for Docker is limited by the virtual machine or Docker Desktop 
settings.

#### Install Open Y site

After `fin build_project` command finish you need to install site. For this 
you can use one of this commands:
- `fin init`
- `fin install_steps`
- `fin upgrade_init`

More details about this commands you can get below.

## Alternative installation process

```bash
# Install Docksal
curl -fsSL https://get.docksal.io | bash
# Change directory to your workspace
fin run-cli composer create-project ymcatwincities/openy-project openy --no-interaction --no-dev
cd openy
fin run-cli composer install
fin init
```


Open the URL printed at the end of the setup (e.g. `http://openy.docksal`) to see your local copy of the latest stable Open Y.

# Docksal environment for Open Y

Open the project's folder and run one of the commands.

Administrator account is _admin_:_admin_.

### Start the project

```bash
fin init
```


The webserver starts up, and the site will be installed automatically with `drush si`.

### Install site from UI
```bash
fin install_steps
```

The webserver starts up and for site will be provided base configuration. 
After finish you need to open site in browser and continue installation from UI.
This command is useful for testing Open Y install form.

### Testing Upgrade path
```bash
fin upgrade_init
```

The webserver starts up and the site will be installed from Open Y DB dump 
that contain pre-installed previous Open Y version.
After installation will be executed all new updates that were added in the latest Open Y versions.

More information about the upgrade path you can find here - [How to support upgrade path](https://github.com/ymcatwincities/openy/blob/8.x-2.x/docs/Development/Upgrade%20path.md)


# How to develop?

After you run the "fin init" and have your environment ready you need to do few things.

- Create a fork of [http://github.com/ymcatwincities/openy](http://github.com/ymcatwincities/openy).
- In your project go to `docroot/profiles/contrib/openy` and edit `.git/config` file. Replace repo URL to your newly created fork.
- Then you can create a branch in your repo, push some code and create a pull request back to `ymcatwincities/openy` repo.

# How to run behat tests?

Edit `behat.local.yml` and set `base_url` to `web` and `wd_host` to `http://browser:4444/wd/hub`. 
Then you can run your behat tests with `./vendor/behat/behat/bin/behat`.
