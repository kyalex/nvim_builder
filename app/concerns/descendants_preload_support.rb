module DescendantsPreloadSupport
  extend ActiveSupport::Concern

  class_methods do
    def preload_descendants(pattern)
      Dir[Rails.root.join(pattern).to_s].each { |f| require f }
    end
  end
end
