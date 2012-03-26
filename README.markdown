Simple demo application for testing purposes
============================================

Replicates most of functionality of the SpringFramework Petclinic application from Java.

Relatively naive implementation is intended (scaffolds, etc) since this project is required to be a
relatively simple Rails app for testing.

Instructions for initializing database for testing
--------------------------------------------------
 * You should update the database.yml file with appropriate mysql setup.
 * You can inspect the lib/tasks/sample_data.rake file to see how data is created and make changes.
 * The following command will create the basic data set for the testing
 `rake db:populate`
 * The size of the data set is comfigurable - check the constants on the sample_data.rake file.
 * These values are set high for performance and stability testing to mimic n+1 SQL query problems.

Running on a server
-------------------
Chef solo cookbooks are provided to ease setup on a new server to demonstrate load. You should be able to bootstrap the entire set of requirements quickly on any provider with Ubuntu 11.10. The scripts reset and repopulate the database on deploy.

* Check out the code onto your server with `git clone --recursive git://github.com/niralisse/RailsPetClinic.git`
* Edit `deploy/solo.json` to add your New Relic license key to enable application and server monitoring.
* Then cd to `deploy/`, and run `install.sh` as root. This should install chef, ruby, and other prereqs, then install the whole shebang to run the pet clinic app, including mysql, nginx, and monit. When the install run completes you'll have another checkout in `/web_apps/rails_pet_clinic`, the actual site will be hosted from there.
* Visit your server's IP address to see the site running.

Running on Vagrant
------------------
A `Vagrantfile` is provided for use testing the app and its deploy infrastructure with [Vagrant]("http://vagrantup.com"). A `vagrant up` should be all that is required once you add the box. Vagrant runs do not have a New Relic license key by default, add yours to the `Vagrantfile` and run `vagrant provision` to add it. You may also enable server monitoring in the same file after you add your key.


 Running Load
 ------------
 * There is a sample JMeter load script in the test/load_script directory
 * The user.properties file should be put in the bin directory of the JMeter install
 * This version was used with nginx listening on port 8980.

