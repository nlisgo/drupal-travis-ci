What is drupalfiles/ ?
=======================

This is a folder where the Drupalmatic profile assigns the private and temporary directories.

This means that, among other things, our Backup And Migrate files will be in a subfolder here: `private/backup_migrate/`

The Drupalmatic profile will create a B&M destination called `fixture`. You can create a profile and store backups in this destination. Through .gitignore magic, this destination's folder will be included in the git repository, and will be pushed when you push the repo.

Drupalmatic's Travis-CI integration will restore the most recent backup in the `fixture` destination for use in continuous integration testing. Therefore, it's a good idea to manage this destination wisely... Don't put it on an automatic schedule and be sure to delete unneeded backups there.
