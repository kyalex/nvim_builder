class PluginsController < ApplicationController
  def index
    render Plugins::IndexView.new(plugins: BasePlugin.descendants)
  end
end
