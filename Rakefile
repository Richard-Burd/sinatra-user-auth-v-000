ENV["SINATRA_ENV"] ||= "development"


# You can't see the rake options by typing in <<rake -T>> like normal...
# ...now you gotta type in <<bundle exec rake -T>>
# ...Paul S. put in a shortcut <<bex rake -T>> onto the bash-user profile.
# ....and <<bundle exec>> for all rake tasks.
require "sinatra/activerecord/rake"
require_relative './config/environment'

#adding this didn't get the <<rake -T>> command in bash to work :(
#require_relative './app/controllers/application_controller'

# Type `rake -T` on your command line to see the available rake tasks.



desc "Enter the console and explore the program"
task :console do
  Pry.start
end
