This is a Docksal-based for the [OpenY](https://github.com/ymcatwincities/openy) Drupal distribution.

[Docksal](https://docksal.io/) is used as a local development environment.

## Get Started

You need to install Docksal on your local machine according to [Docksal setup](http://docksal.readthedocs.io/en/master/getting-started/env-setup/) instructions.

# Docksal environment for OpenY

Open **openy** folder and run 
```
fin init
```
to start the project.

If you run multiple OpenY installations, you need to change **VIRTUAL_HOST** variable in the _.docksal/docksal.env_ file.

The webserver starts up, and the site will be installed automatically.

Administrator account is _admin_:_admin_.

# How to develop?

After you run the "fin init" and have your environment ready you need to do few things.

- Create a fork of [http://github.com/ymcatwincities/openy](http://github.com/ymcatwincities/openy).
- In your project go to `docroot/profiles/contrib/openy` and edit **.git/config file**. Replace repo URL to your newly created fork.
- Then you can create a branch in your repo, push some code and create a pull request back to ymcatwincities/openy repo.

# How to run behat tests?

Then edit behat.local.yml and change base_url to "web" and wd_host to "http://browser:4444/wd/hub". Then you can run your behat tests with "./vendor/behat/behat/bin/behat".
