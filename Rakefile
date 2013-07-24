#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

EcommerceSample::Application.load_tasks

namespace :db do
  task :regenerate do
   system("rake db:drop RAILS_ENV=development")
   system("rake db:migrate")
  end
end


