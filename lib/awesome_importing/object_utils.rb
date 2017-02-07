module AwesomeImporting
  #
  # Provides an extension for an `Object` class
  #
  module ObjectUtils
    # Imports module or class in a current context with a given name.
    # If a name is not spicified, the demodulized name of a module or class will be used.
    #
    # @param module_or_class [Class,Module] - Class or module which you want to importing
    # @param as [String] - A custom name for an importing module or class
    # @raise AwesomeImporting::NameAlreadyTaken when collision has been occured and
    #   collision checking is strict
    def importing(module_or_class, as: nil)
      mc_name = as || _importing_demodulize(module_or_class.name)
      _importing_collision_checking(mc_name)
      Object.const_set mc_name, module_or_class
    end

    private

    def _importing_collision_checking(mc_name)
      Object.const_get mc_name
      AwesomeImporting.config.logger.warn "A constant name `#{mc_name}` is already taken!"
      raise AwesomeImporting::NameAlreadyTaken, mc_name if AwesomeImporting.config.strict_collision_checking
    rescue ::NameError
    end

    def _importing_demodulize(name)
      name.split("::").last
    end
  end
end

Object.send :include, AwesomeImporting::ObjectUtils
