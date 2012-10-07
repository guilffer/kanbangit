require 'kanbangit/item'

module Kanbangit
  class Kanban
  
    attr_accessor :items, :columns
  
    def initialize(env)
      @items = []
      @columns = ['todo', 'doing', 'done']
      @env = env
    end
  
    def load_items_from_fs!
      Dir.entries(@env.items_path).each do |file|
        @items << Item.new(file.sub('.yml',''),@env) if file.end_with? ".yml"
      end
    end
  
    def pretty_print
      @columns.inject('') do |out, column|
        out << "[#{column}]\n"
        @items.map do |item|
          out << "- #{item.name}\n" if item.column == column
        end
        out << "\n"
      end
    end
    
  end
end