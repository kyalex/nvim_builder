class PluginsController < ApplicationController
  def index
    @plugins = BasePlugin.descendants
  end
end
