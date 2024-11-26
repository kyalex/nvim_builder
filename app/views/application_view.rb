# frozen_string_literal: true

class ApplicationView < ApplicationComponent
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::TurboFrameTag

  def self.accepts(*attributes)
    define_method(:initialize) do |**args|
      attributes.each do |attr|
        raise ArgumentError, "Missing keyword: #{attr}" unless args.key?(attr)

        instance_variable_set(:"@#{attr}", args[attr])
      end
    end

    attr_reader(*attributes)
  end
end
