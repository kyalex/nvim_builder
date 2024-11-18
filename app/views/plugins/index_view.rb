class Plugins::IndexView < ApplicationView
  def initialize(plugins:)
    @plugins = plugins
  end

  def view_template
    div do
      h1 { "Plugins" }

      @plugins.each do |plugin|
        hr
        h4 { plugin.plugin_name }
        p { plugin.description }
        p { link_to "Homepage", plugin.homepage }
        code { render file: plugin.plugin_path, layout: false }
        button_to "Add", users_plugins_path(plugin.id), params: { plugin_id: plugin.id }, method: :post
      end
    end
  end
end
