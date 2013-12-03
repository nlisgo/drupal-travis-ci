[![Build Status](https://travis-ci.org/paul-m/drupal-travis-ci.png?branch=master)](https://travis-ci.org/paul-m/drupal-travis-ci)

What Is This?
=============

This is a package which helps you run continuous integration of behavioral testing on Drupal sites through Travis-CI.

It is a template build environment to which you can add your own tests (and other test systems).

The purpose of this exercise is to have a uniform, standardized behavioral testing environment for Drupal, which can be easily adapted to specific needs.

The system uses Behat for behavioral testing. Currently it only tests that the system has deployed and the site has a front page.

Requirements
------------

- git
- Github repo configured to use travis-ci.
- *AMP stack
- drush

For local testing:

- curl

How?
----

NOTE: THESE BUILD INSTRUCTIONS ARE INCOMPLETE. Mostly because the project is incomplete. :-)

Set up your github project repo to work with Travis-CI: http://about.travis-ci.org/docs/user/getting-started/

Grab the drupalmatic repo.

	git clone git@github.com:paul-m/drupal-travis-ci.git
	cd drupal-travis-ci

Change your repo origin. You don't want to end up pushing your project back to the drupalmatic repo. :-)

	git remote ...

Build a site from the drupalmatic profile. This will be replaced by a script soon-ish. Be sure and substitute your database credentials and db name in the `drush si` command.

	drush make drushmake/drupalmatic.make drupal
	cp -r drushmake/drupalmatic drupal/profiles
	cd drupal
	drush si drupalmatic --db-url=mysql://root:@localhost/drupal --yes

Build your project site on the Drupal site you just made.

Make behavioral tests in Behat/Gherkin, and put those tests in `/features`

**(Note that the rest of these instructions aren't implemented.)**

Dump the database to the database directory. (Backup & Migrate is a dependency.) This will act as a fixture for the tests.

	drush bam ....

Commit the site's files to the repo, including the database dump. Your `.gitignore` can disregard `/drupal` and other directories, since the whole thing will be rebuilt in Travis-CI.

	git add -A :/
	git commit -m 'this site is ready for behavioral testing'

Push to github.

	git push origin master

Wait for an email from Travis CI, or go watch the build.

Run Tests Locally
-----------------

Once you have your local setup running (see previous set of instructions), you can test it.

Tests are in Behat, which requires some work with Composer to install.

You can look at the `travis.behat.yml` file for some clues as to how this works. Or you can continue with these instructions:

Go to the project directory

	cd drupal-travis-ci	

Install Composer

	curl -sS https://getcomposer.org/installer | php

Use Composer to install Behat and its dependencies

	./composer.phar install

Try to run Behat

	./bin/behat

This will probably fail, because you must provide the Mink extension with a `base_url` setting. This setting is in the `behat.yml.dist` file.

To change it, duplicate `behat.yml.dist`, and name it after your setup.

	cp behat.yml.dist mysetup.behat.yml

Modify the `base_url` setting in your `mysetup.behat.yml` file.

Now you can run Behat again, with the `-c` option specifying your new config file.

	./bin/behat -c mysetup.behat.yml

This distribution comes with two extra Behat configuration files: One for Travis and one for MAMP. You'll see that the only difference is the `base_url` setting.

If all goes well, you should see something like this:

	$ ./bin/behat -c mysetup.behat.yml
	Feature: This site has a home page.
	  In order to verify success at installing the web site
	  As an anonymous user
	  I want to go to the home page without errors
	
	  Scenario: Go to the home page                 # features/homepage.feature:6
	    When I go to the homepage                   # FeatureContext::iAmOnHomepage()
	    Then the response status code should be 200 # FeatureContext::assertResponseStatus()
	
	1 scenario (1 passed)
	2 steps (2 passed)
	0m0.147s

Credit
------

This project was originally a fork of drupal-travis-ci by David Stoline: https://github.com/unn/drupal-travis-ci
