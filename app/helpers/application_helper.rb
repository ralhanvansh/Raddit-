module ApplicationHelper
  def homecheck
    if user_signed_in? == true
      if current_user.role == "Link"
          return links_path
      elsif current_user.role == "Url"
          return  url_index_path
      else
          return new_user_session_path
      end
    else
       return new_user_session_path
    end
  end
end
