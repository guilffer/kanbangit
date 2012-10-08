require 'yaml'

module Kanbangit
  class Item
  
    attr_reader :name
    
    def initialize(name, env)
      @name = name
      @env = env
      create_itemfile_if_necessary
      load_itemfile
    end
    
    def create_itemfile_if_necessary
      unless File.exists?(itemfile_path)
        @data = {'column' => 'todo'}
        update_file
      end
    end
    
    def load_itemfile
      @data = YAML.load_file itemfile_path()
    end
    
    def itemfile_path
      File.join(@env.items_path, name+'.yml')
    end
    
    def update (key, value)
      @data[key.to_s] = value
      update_file
    end
    
    def method_missing(method_name)
      @data[method_name.to_s] if @data.has_key? method_name.to_s
    end
    
    private 
    
    def update_file
      File.open itemfile_path, 'w' do |file|
        file.write(@data.to_yaml)
      end
    end
    
  end
end