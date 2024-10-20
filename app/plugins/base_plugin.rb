class BasePlugin
  include DescendantsPreloadSupport
  include DSLSupport

  define_attributes %i[plugin_name description homepage]

  preload_descendants "app/plugins/**/*.rb"

  class << self
    def plugin_path
      Rails.root.join("app", "plugins", "#{name.underscore}.lua")
    end
  end
end
