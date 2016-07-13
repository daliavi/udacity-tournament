# Tournament Database
The “Tournament Database” project is a part of the Full Stack Nano Degree program provided  by [Udacity] (www.udacity.com) .
In this project, I wrote a Python module that uses the PostgreSQL database to keep track of players and matches in a game tournament.
The game tournament uses the Swiss system for pairing up players in each round. Note: there is no GUI for this project.

##Prerequisites
- Python (tested with version 2.7.10)
- PostgresSQL (tested with 9.3.1)
- Virtual Box and Vagrant

##Steps
To run the project on a virtual machine:
- download Vagrant configuration from https://github.com/udacity/fullstack-nanodegree-vm
- download project files to /vagrant/tournament directory
- login to PostgresSQL on the VM and create the database schema from trounament.sql file
- type: `$ \i tournament.sql` 
- in the command line on the VM navigate to the /tournament directory
- type: `$ python tournament_test.py` and click Enter/Return to run the tests
