module AwesomeAliasing
  #
  # Provides an extension for an `Object` class
  #
  module ObjectUtils
    # Imports module or class in a current context with a given name.
    # If a name is not spicified, the demodulized name of a module or class will be used.
    #
    # @param module_or_class [Class,Module] - Class or module which you want to aliasing
    # @param as [String] - A custom name for an aliased module or class
    # @raise AwesomeAliasing::NameAlreadyTaken when collision has been occured and
    #   collision checking is strict
    def aliasing(module_or_class, as: nil)
      mc_name = _aliasing_resolve_target_name(as, module_or_class.name)
      _aliasing_collision_checking(mc_name)
      _aliasing_define_const(mc_name, module_or_class)
    end

    private

    def _aliasing_resolve_target_name(custom, mc_name)
      custom || _aliasing_demodulize(mc_name)
    end

    def _aliasing_demodulize(name)
      name.split("::").last
    end

    def _aliasing_collision_checking(mc_name)
      Object.const_get mc_name
      AwesomeAliasing.config.logger.warn "A constant name `#{mc_name}` is already taken!"
      raise AwesomeAliasing::NameAlreadyTaken, mc_name if AwesomeAliasing.config.strict_collision_checking
    rescue ::NameError
    end

    def _aliasing_define_const(name, module_or_class)
      Object.const_set name, module_or_class
    end
  end
end

Object.send :include, AwesomeAliasing::ObjectUtils
