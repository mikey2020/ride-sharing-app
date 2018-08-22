# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'rubygems'
require 'rake'
require_relative 'config/application'

Rails.application.load_tasks
begin
  require 'rspec/core/rake_task'
  require 'coveralls/rake/task'
  desc 'Run RSpec'
  RSpec::Core::RakeTask.new do |t|
    t.verbose = false
  end
  Coveralls::RakeTask.new
rescue LoadError
end
task default: :spec

