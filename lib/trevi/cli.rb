require 'pathname'
require 'fileutils'
require 'thor'
require 'thor/group'
require 'trevi/extensions'

module Trevi
  class CLI < Thor::Group
    include Thor::Actions

    def self.source_root
      File.expand_path('../../../templates', __FILE__)
    end

    desc "Creates a new Sinatra application"
    argument :name, :type => :string, :desc => "The name of the new application"

    def setup
      @app_path = name.directory_name
      @name     = name.file_name

      options.each do |key, value|
        instance_variable_set "@#{key.to_s}".to_sym, value
      end
    end

    def create_app
      directory 'app', @app_path
    end

    def initialize_git_repo
      inside(@app_path) do
        run('git init .')
      end
    end

    def install_dependencies
      inside(@app_path) do
        run('bundle')
      end
    end
  end
end
