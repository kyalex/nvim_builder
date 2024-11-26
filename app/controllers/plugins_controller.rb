class PluginsController < ApplicationController
  def index
    render Plugins::IndexView.new(plugins: BasePlugin.descendants)
  end

  def show
    respond_to do |format|
      format.turbo_stream
      format.html { render Plugins::ShowView.new(plugin: BasePlugin.find(params[:id])) }
    end
  end
end
