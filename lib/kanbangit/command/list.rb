require 'kanbangit/command'
require 'kanbangit/kanban'

module Kanbangit
  module Command
    
    class List < Command
      def execute
        if Dir.exists? @env.items_path
          kanban = Kanban.new @env
          kanban.load_items_from_fs!
          kanban.pretty_print
        else 
          'Not a kanbangit repository'
        end
      end
    end
    
  end
end