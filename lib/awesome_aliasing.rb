require "awesome_aliasing/version"

module AwesomeAliasing
  autoload :Config, 'awesome_aliasing/config'
  autoload :NameAlreadyTaken, 'awesome_aliasing/name_already_taken'
  autoload :ObjectUtils, 'awesome_aliasing/object_utils'

  # Provides config object to configure AwesomeAliasing library
  #
  # @return [AwesomeAliasing::Config]
  def self.config(&block)
    @_config ||= Config.new
    block_given? ? yield(@_config) : @_config
  end
end
