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
 
