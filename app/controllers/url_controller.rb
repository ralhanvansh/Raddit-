class UrlController < ApplicationController
before_action :rolecheck



private
  def rolecheck
    if user_signed_in?
        if current_user.role == "Url"
        else
          redirect_to root_path ,alert: "You don't have permission to access that page"
        end
    else
      redirect_to root_path
    end
  end


end
