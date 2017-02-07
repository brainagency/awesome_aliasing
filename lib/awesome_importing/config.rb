module AwesomeImporting
  #
  # Config object for an AwesomeImporting library
  #
  class Config
    # Specifies collision checking either strict or not. 
    # If yes a `AwesomeImporting::NameAlreadyTaken` exception will be thrown.
    # And if not - just a warning message will be written to the logs.
    attr_accessor :strict_collision_checking

    # Initializes new config object.
    # During the initialization all properties will accept default values:
    # - `strict_collision_checking` will be evaluated to `false` value
    def initialize
      @strict_collision_checking = false
    end
  end
end
