module AwesomeUse
  #
  # Config object for an AwesomeUse library
  #
  class Config
    # Specifies collision checking either strict or not. 
    # If yes a `AwesomeUse::NameAlreadyTaken` exception will be thrown.
    # And if not - just a warning message will be written to the logs.
    attr_accessor :strict_collision_checking

    # Specifies logger of a library.
    # By default `AwesomeUse::Config::PutsLogger` is used.
    attr_accessor :logger

    # Initializes new config object.
    # During the initialization all properties will accept default values:
    # - `strict_collision_checking` will be evaluated to `false` value
    def initialize
      @strict_collision_checking = false
      @logger = PutsLogger.new
    end

    # 
    # Default logger which is out-of-box and set up as default logger of a library
    #
    class PutsLogger
      # Puts warning message to the stdout
      #
      # @param message [String] - A message which will be printed as a warning one
      def warn(message)
        puts "[WARN] #{message}"
      end
    end
  end
end
