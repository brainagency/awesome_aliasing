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
    def importing(module_or_class, as: nil)
      mc_name = as || module_or_class.name.demodulize
      if defined?(mc_name)
        Rails.logger.warn "Trying to import `#{module_or_class.name}` as `#{mc_name}`, but there is already an object with a given name!"
      end
      Object.const_set mc_name, module_or_class
    end
  end
end

Object.send :include, AwesomeImporting::ObjectUtils
