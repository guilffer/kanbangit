module Kanbangit
  module Command
    class Command
      def initialize(argv, env)
        @argv = argv
        @env = env
      end

      def execute
      end
    end
  end
end