require 'kanbangit/item'
require 'kanbangit/kanban'

module Kanbangit
  class CLI
    def initialize(env)
      @env = env
    end
    
    def execute (*args)
      args.flatten!
      command = args.shift.capitalize
      Command.const_get(command).new(args, @env).execute
    end
  end
  
  module Command
    class Command
      def initialize(argv, env)
        @argv = argv
        @env = env
      end
      
      def execute
      end
    end
    
    class Init < Command
      def execute
        unless Dir.exists? @env.items_path
          FileUtils.mkdir_p @env.items_path
        else
          "Already a kanbangit repository"
        end
      end
    end
    
    class Add < Command
      def execute
        if Dir.exists? @env.items_path
          item = Item.new(@argv[0], @env)
          "#{item.name} added to column #{item.column}"
        else
          'Not a kanbangit repository'
        end
      end
    end
    
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