# Python Virtual Environments


a place to install packages that are specific to a certain project
- also like packrat for R where you want to use a specific older version of a package in a snapshot

A good module to use for this is the venv module

to make a new project in a virtual environment use this command:

`python3 -m venv project_env`

to make multiple environments for different projects but all in a single overarching directory, then just run `python3 -m venv projects/env_name`

then activate it:

`source project_env/bin/activate`

confirm usage by

`which python`

and in the venv if you run `pip list` it will show you all the installed packages (only pip and setup tools) installed packages will now be stored here

To get a list of the packages to send for reproducable analysis run:

`pip freeze`

and the output can go to _requirements.txt_

to deactivate the venv then run the `deactivate` command

To take a new virtual environment and install a list of requirements that we exported above, run:

`pip install -r requrirements.txt`

You can put your virtual environment into the project folder but you dont want to put your project files into the venv as the venv is just the place where execution is taking place, your working files should be in your project directory.

the venv's are meant to be disposable and easy to throw away so no project files in them.

also never commit your venv's to source control, put them in gitignore
but what you would commit to source control is the _requirements.txt_ doc

to create a venv with access to the system global packages for python from within a virtual environment run:

`python3 -m venv venv --system-site-packages`

the difference is that now you copied your system packages to the venv but new installs will only go into the venv until you remove it

to see packages that are only installed in the venv and not the system you can run:

`pip list --local`

same logic for

`pip freeze --local`

---
References: 
- [[New Python Project Workflow]]
