class Home::IndexView < ApplicationView
  def view_template
    if helpers.current_user
      div do
        span { "Welcome #{helpers.current_user.uid}!" }
        button_to "Sign Out", sign_out_path, method: :delete, data: { turbo: "false" }
      end
    else
      button_to "Sign in with Github", "/auth/github", method: :post, data: { turbo: "false" }
    end
  end
end
