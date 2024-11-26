class Plugins::ShowView < ApplicationView
  accepts :plugin

  def view_template
    turbo_frame_tag("preview") do
      h4 { plugin.plugin_name }
      p { plugin.description }
      p { link_to "Homepage", plugin.homepage }
      code { render file: plugin.plugin_path, layout: false }
    end
  end
end
