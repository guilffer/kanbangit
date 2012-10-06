require 'rspec/core/rake_task'

require 'fileutils'
require 'kanbangit/kanban'
require 'kanbangit/item'

ENV['ITEMS_PATH'] = '.kanban/items/'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :kanban do
  task :list => :create_items_path do
    kanban = Kanbangit::Kanban.new
    kanban.load_items_from_fs!
    puts kanban.pretty_print
  end

  task :add_item => :create_items_path do
    Kanbangit::Item.new ENV['name']
  end

  task :create_items_path do
    FileUtils.mkdir_p ENV['ITEMS_PATH'] unless Dir.exists? ENV['ITEMS_PATH']
  end
end