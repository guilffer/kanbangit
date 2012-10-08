Dir["lib/kanbangit/command/*.rb"].each do |file| 
  require 'kanbangit/command/'+File.basename(file) 
end

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

end