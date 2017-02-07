require "awesome_importing/version"

module AwesomeImporting
  autoload :Config, 'awesome_importing/config'
  autoload :NameAlreadyTaken, 'awesome_importing/name_already_taken'
  autoload :ObjectUtils, 'awesome_importing/object_utils'

  # Provides config object to configure AwesomeImporting library
  #
  # @return [AwesomeImporting::Config]
  def self.config(&block)
    @_config ||= Config.new
    block_given? ? yield(@_config) : @_config
  end
end
