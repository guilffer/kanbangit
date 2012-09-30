require 'item'

class Kanban

  attr_accessor :items, :columns

  def initialize
    @items = []
    @columns = ['todo', 'doing', 'done']
  end

  def load_items_from_fs!
    Dir.entries(ENV['ITEMS_PATH']).each do |file|
      @items << Item.new(file.sub('.yml','')) if file.end_with? ".yml"
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