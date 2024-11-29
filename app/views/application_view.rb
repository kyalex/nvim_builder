# frozen_string_literal: true

class ApplicationView < ApplicationComponent
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::TurboFrameTag

  class_attribute :attributes, default: []

  def self.accepts(*attributes)
    self.attributes += Array.wrap(attributes)
    attr_reader(*self.attributes)
  end

  def initialize(**args)
    self.class.attributes.each do |attr|
      raise ArgumentError, "Missing keyword: #{attr}" unless args.key?(attr)

      instance_variable_set(:"@#{attr}", args[attr])
    end
  end
end
