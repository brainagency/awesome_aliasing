module AwesomeUse
  #
  # Provides an extension for an `Object` class
  #
  module ObjectUtils
    # Imports module or class in a current context with a given name.
    # If a name is not spicified, the demodulized name of a module or class will be used.
    #
    # @param module_or_class [Class,Module] - Class or module which you want to use
    # @param as [String] - A custom name for an used module or class
    # @raise AwesomeUse::NameAlreadyTaken when collision has been occured and
    #   collision checking is strict
    def use(module_or_class, as: nil)
      mc_name = _use_resolve_target_name(as, module_or_class.name)
      _use_collision_checking(mc_name)
      _use_define_const(mc_name, module_or_class)
    end

    private

    def _use_resolve_target_name(custom, mc_name)
      custom || _use_demodulize(mc_name)
    end

    def _use_demodulize(name)
      name.split("::").last
    end

    def _use_collision_checking(mc_name)
      Object.const_get mc_name
      AwesomeUse.config.logger.warn "A constant name `#{mc_name}` is already taken!"
      raise AwesomeUse::NameAlreadyTaken, mc_name if AwesomeUse.config.strict_collision_checking
    rescue ::NameError
    end

    def _use_define_const(name, module_or_class)
      Object.const_set name, module_or_class
    end
  end
end

Object.send :include, AwesomeUse::ObjectUtils
