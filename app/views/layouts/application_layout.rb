# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout
  include Phlex::Rails::Helpers::ContentFor

  def view_template(&block)
    doctype

    html do
      head do
        title { content_for(:title) || "Nvim Builder" }

        meta name: "viewport", content: "width=device-width,initial-scale=1"
        meta name: "apple-mobile-web-app-capable", content: "yes"
        meta name: "mobile-web-app-capable", content: "yes"

        csp_meta_tag
        csrf_meta_tags

        stylesheet_link_tag "application", data_turbo_track: "reload"

        javascript_include_tag "application", data_turbo_track: "reload", type: "module"
      end

      body do
        main(class: "container mx-auto mt-28 px-5 flex font-sans", &block)
      end
    end
  end
end
