This is a Docksal-based for the [Open Y](https://github.com/ymcatwincities/openy) Drupal distribution.

[Docksal](https://docksal.io/) is used as a local development environment.

## Get Started

You need to install Docksal on your local machine according to [Docksal setup](http://docksal.readthedocs.io/en/master/getting-started/env-setup/) instructions.

### Full install from scratch

Note: a local instance of PHP and/or Composer is not required.

```bash
# Install Docksal
curl -fsSL https://get.docksal.io | bash
# Change directory to your workspace
fin run-cli composer create-project ymcatwincities/openy-project openy --no-interaction --no-dev
cd openy
fin run-cli composer install
fin init
```

You should see something like

```
MBP-Andrii:openy podarok$ fin init
 Step 1: Recreating services. 
Removing containers...
Removing network openy_default
WARNING: Network openy_default not found.
Removing volume openy_project_root
WARNING: Volume openy_project_root not found.
Volume docksal_ssh_agent is external, skipping
Starting services...
Creating network "openy_default" with the default driver
Creating volume "openy_project_root" with local driver
Pulling web (docksal/web:latest)...
latest: Pulling from docksal/web
88286f41530e: Pull complete
Digest: sha256:8575b2bb305faa7cafaf209c259ad708431bf66a7f4ce3c08411854da211ac06
Status: Downloaded newer image for docksal/cli:edge-php7.1
Creating openy_cli_1 ... done
Creating openy_db_1  ... done
Creating openy_web_1 ... done
Waiting for openy_cli_1 to become ready...
Connected vhost-proxy to "openy_default" network.
 Step 2: Waiting 5s for MySQL to start. 
[==========]
 Step 3: Installing site. 
Install site from 'openy' profile.
You are about to create a /var/www/docroot/sites/default/settings.php file and DROP all tables in your 'default' database. Do you want to continue? (y/n): y
Starting Drupal installation. This takes a while. Consider using the --notify global option.                                           [ok]
error sending mail
2018/07/03 11:07:23 dial tcp 194.60.69.106:1025: getsockopt: connection timed out
Installation complete.                                                                                                                 [ok]                                                                             [status]
Congratulations, you installed Open Y!    
Clear caches.
Cache rebuild complete.                                                                                                                [ok]
Created three GoogleTagManager snippet files based on configuration.                                                                   [status]

real    22m8.914s
user    0m1.720s
sys     0m0.780s
 DONE!  Open http://openy.docksal in your browser to verify the setup.
```

Open the URL printed at the end of the setup (e.g. `http://openy.docksal`) to see your local copy of the latest stable Open Y.

# Docksal environment for Open Y

Open the project's folder and run one of the commands.

Administrator account is _admin_:_admin_.

### How to build Open Y project ?
With `build_project` command you can build Open Y project inside
docker container, no need install composer on local environment for this.

Follow these steps to get fully prepared project:

- Clone openy-docksal:
```bash
git clone git@github.com:ymcatwincities/openy-docksal.git
```
- Create `docksal-local.env` file inside `.docksal` directory with content:
```yaml
OPENY_PROJECT_VERSION='8.2.x-dev'
OPENY_VERSION='8.x-2.x'
GIT_REMOTE_ORIGIN='git@github.com:USER/openy.git'
```
- Replace `USER` by your user name from github or remove `GIT_REMOTE_ORIGIN` if you doesn't have fork of `ymcatwincities/openy`
Also you can set here corresponding versions of openy-project and openy.

- Run `fin build_project` command inside your project directory.
As result you will get full Open Y installation in your file system.

- Last step - run `fin init` command inside your project directory.
As result you will get installed site.

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
