module DSLSupport
  extend ActiveSupport::Concern

  class_methods do
    def define_attributes(attributes)
      Array.wrap(attributes).each do |method_name|
        define_singleton_method(method_name) do |value = nil|
          return instance_variable_get(:"@#{method_name}") if value.nil?

          instance_variable_set(:"@#{method_name}", value)
        end
      end
    end
  end
end
