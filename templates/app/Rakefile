#!/usr/bin/env rake

task :app do
  require './app'
end

Dir[File.dirname(__FILE__) + '/lib/tasks/*.rake'].sort.each do |path|
  load path
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
  # no rspec available
end
