require 'kanbangit/command'

module Kanbangit
  module Command
    
    class Init < Command
      def execute
        unless Dir.exists? @env.items_path
          FileUtils.mkdir_p @env.items_path
        else
          "Already a kanbangit repository"
        end
      end
    end
    
  end
end