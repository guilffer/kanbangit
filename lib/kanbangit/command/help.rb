require 'kanbangit/command'

module Kanbangit
  module Command
    
    class Help < Command
      def execute
        'add, forward, help, init, list'
      end
    end
    
  end
end