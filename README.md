This is a Docksal-based for the [YMCA’s Website Service](https://github.com/YCloudYUSA/yusaopenyy) Drupal distribution.

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
YUSAOPENY_PROJECT_VERSION='9.2.x'
YUSAOPENY_VERSION='9.x-2.x'
GIT_REMOTE_UPSTREAM='git@github.com:USER/yusaopeny.git'
IGNORE_CUSTOM='.idea'
```
- Use `OPENY_PROJECT_VERSION` to specify the branch of the 
`YCloudYUSA/yusaopeny-project` to be used as a composer project. In the most 
cases you'll need:

  - `9.2.x` for a last stable yusaopeny release.
  - `9.2.x-development` for a latest development yusaopeny.
  
- Use `YUSAOPENY_VERSION` to specify the branch of the `YCloudYUSA/yusaopeny` will 
be checkout automatically. Take in mind, the yusaopeny version corresponds the one, 
required in a root `composer.json`. Use `9.x-2.x` to start the development from 
the latest yusaopeny progress.

- Replace `USER` by your user name from github or remove `GIT_REMOTE_UPSTREAM` 
if you don't need an upstream repository to be set automatically.

- During an execution of a `build_project` command, all the directories except 
an ignored ones would be deleted. 
If you work on the existing project and want to save any folder in a project 
root directory - add folder name to `IGNORE_CUSTOM`. Directories names should be 
separated with spaces.

If you want to use your fork as an origin remote and the main repository as an 
upstream remote, add the following variables to the `docksal-local.env` file 
as follows:
```yaml
GIT_REMOTE_UPSTREAM='git@github.com:YCloudYUSA/yusaopeny.git'
GIT_REMOTE_ORIGIN='git@github.com:USER/yusaopeny.git'
```
In this case, after project install git will already track the repositories 
you specified as `origin` and `upstream` remotes

#### Build Y USA Open YMCA project
Run this command inside your project directory:
```bash
fin build_project
```
As a result you will get full YMCA’s Website Service installation in your file system.

The "Killed" message during command run usually means that you need to increase 
memory limits in your Docksal. For macOS or Windows overall memory volume 
available for Docker is limited by the virtual machine or Docker Desktop 
settings.

#### Install YMCA’s Website Service site

After `fin build_project` command finish you need to install a site. For this 
you can use one of this commands:
- `fin init`
- `fin install_steps`
- `fin upgrade_init`

More details about these commands you can get below.

## Alternative installation process

```bash
# Install Docksal
curl -fsSL https://get.docksal.io | bash
# Change directory to your workspace
fin run-cli composer create-project YCloudYUSA/yusaopeny-project yusaopeny --no-interaction --no-dev
cd yusaopeny
fin run-cli composer install
fin init
```


Open the URL printed at the end of the setup (e.g. `http://yusaopeny.docksal.site`) to see your local copy of the latest stable YMCA’s Website Service.

# Docksal environment for YMCA’s Website Service

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
This command is useful for testing YMCA’s Website Service install form.

### Testing Upgrade path
```bash
fin upgrade_init
```

The webserver starts up and the site will be installed from YMCA’s Website Service DB dump 
that contain pre-installed previous YMCA’s Website Service version.
After installation will be executed all new updates that were added in the latest YMCA’s Website Service versions.

# How to develop?

After you run the "fin init" and have your environment ready you need to do few things.

- Create a fork of [https://github.com/YCloudYUSA/yusaopeny](https://github.com/YCloudYUSA/yusaopeny).
- In your project go to `docroot/profiles/contrib/yusaopeny` and edit `.git/config` file. Replace repo URL to your newly created fork.
- Then you can create a branch in your repo, push some code and create a pull request back to `YCloudYUSA/yusaopeny` repo.

# How to run behat tests?

Edit `behat.local.yml` and set `base_url` to `web` and `wd_host` to `http://browser:4444/wd/hub`. 
Then you can run your behat tests with `./vendor/behat/behat/bin/behat`.
