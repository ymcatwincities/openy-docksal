# Docksal environment for OpenY

Install docksal locally and run build.sh script. You will need composer installed to run the build.

Then go to the "openy" folder and run "fin init" to start the project.

Remember that this folder should be under /Users folder.

# How to develop?

After you run the "fin init" and have your environment ready you need to do few things.

1. Create a fork of github.com/ymcatwincities/openy.
2. In your docksal openy go to docroot/profiles/contrib/openy and edit .git/config file. Replace repo URL to your newly created fork.
3. Then you can create a branch in your repo, push some code and create a pull request back to ymcatwincities/openy repo.

# How to run behat tests?

If https://github.com/ymcatwincities/openy-project/pull/2 is not merged yet, you need to go to your container "fin bash", then navigate to profile folder "cd /var/www/docroot/profiles/contrib/openy" and then run "composer update --dev". It will pull behat dependencies for you.

Then edit behat.local.yml and change base_url to "web" and wd_host to "http://browser:4444/wd/hub". Then you can run your behat tests with "./vendor/behat/behat/bin/behat".
