module Authenticable
  def current_user
    @current_user ||= User.find_by(authentication_token: request.headers["AUTH-TOKEN"])
  end
end
