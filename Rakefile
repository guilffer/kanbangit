require 'rspec/core/rake_task'

require 'fileutils'
require 'kanban'
require 'item'

ENV['ITEMS_PATH'] = '.kanban/items/'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :kanban do
    task :list => :create_items_path do
        kanban = Kanban.new
        kanban.load_items_from_fs!
        puts kanban.pretty_print
    end
    
    task :add_item => :create_items_path do
        Item.new ENV['name']
    end
    
    task :create_items_path do
        unless Dir.exists? ENV['ITEMS_PATH']
            FileUtils.mkdir_p ENV['ITEMS_PATH']
        end
    end
end