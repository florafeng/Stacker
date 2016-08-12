require "sinatra/activerecord/rake"

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear
Rake::Task["db:reset"].clear

namespace :db do
  task :load_config do
    require ::File.expand_path('../config/environment', __FILE__)
  end

  desc 'Retrieves the current schema version number'
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end

# Assume SQLite3 DB

  desc "Create the database."
  task "db:create" do
    touch 'db/db.sqlite3'
  end

  desc "Drop the database."
  task "db:drop" do
    rm_f 'db/db.sqlite3'
  end

  desc "Seed the database."
  task "db:seed" do
    require './db/seeds.rb'
  end

end

