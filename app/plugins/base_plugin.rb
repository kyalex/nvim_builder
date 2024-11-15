class BasePlugin
  include DescendantsPreloadSupport
  include DSLSupport

  define_attributes %i[plugin_name description homepage]

  preload_descendants "app/plugins/**/*.rb"

  class << self
    def plugin_path
      Rails.root.join("app", "plugins", "#{id}.lua")
    end

    def id
      name.underscore
    end
  end
end
