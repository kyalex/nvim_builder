class Plugins::IndexView < ApplicationView
  accepts :plugins

  def view_template
    div(class: "grid grid-cols-2 gap-2") do
      div do
        plugins.each do |plugin|
          h4 { plugin.plugin_name }
          link_to "Details", plugin_path(plugin.id), data: { turbo_frame: "preview" }
        end
      end

      div do
        turbo_frame_tag("preview") do
          p { "Select an item to see the preview" }
        end
      end
    end
  end
end
