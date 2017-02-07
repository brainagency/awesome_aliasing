module AwesomeImporting
  #
  # An exception which will be trown if collision checking is strict and collision has been occured
  #
  class NameAlreadyTaken < ::StandardError
    # Initializes new exception instance
    #
    # @param const_name [String] - A name of a constant for which collision has been occured
    def initialize(const_name)
      super "A constant name `#{const_name}` is already taken!"
    end
  end
end
