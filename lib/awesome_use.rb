require "awesome_use/version"

module AwesomeUse
  autoload :Config, 'awesome_use/config'
  autoload :NameAlreadyTaken, 'awesome_use/name_already_taken'
  autoload :ObjectUtils, 'awesome_use/object_utils'

  # Provides config object to configure AwesomeUse library
  #
  # @return [AwesomeUse::Config]
  def self.config(&_block)
    @_config ||= Config.new
    block_given? ? yield(@_config) : @_config
  end
end
