# Load the rails application
require File.expand_path('../application', __FILE__)

# Enable GC stats
GC.enable_stats if GC.respond_to? :enable_stats

# Initialize the rails application
RailsPetClinic::Application.initialize!
