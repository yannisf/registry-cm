# Registry configuration management

This project sets up a virtual machine that will run the **Registry** application. The virtual machine is setup using _Vagrant_ and _Virtualbox_ and is based on an _Ubuntu_ box. During the Vagrant VM provisiong phase, _docker_ and _docker-compose_ are installed. The application is instantiated through Dockerfiles, and requires two services, a _Postgres_ database server, and a _Tomcat_ server.

Postgres is initialized by restoring an existing dump, that should be available as `/vagrant/compose/dump.tar` (the deployer is expected to put the dump there). Tomcat is initialized with an existing Registry application that is build and stored in `Github` as a release.

Upon `vagrant up`, and after waiting for a while for the box to be downloaded and the virtual machine instantiated and provisioned, the application will start and should be available from the host machine through `http://localhost:8888`.

A database backup can be taken at any time by logging into the vagrant container (`vagrant ssh`), and running `/vagrant/backup/backup.sh`. A dump of the database will be exported under that directory and should be avaialble from the host machine as well.
