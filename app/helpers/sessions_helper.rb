module SessionsHelper
  def current_user
    user ||= Person.find(session[:person_id]) if session[:person_id]
  end
end
