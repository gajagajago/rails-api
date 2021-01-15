class Api::V1::UsersController < ApplicationController
  def facebook
    if params[:facebook_access_token]
      @graph = Koala::Facebook::API.new(params[:facebook_access_token], Koala.config.app_secret)
      profile = @graph.get_object("me?fields=name,email,id,picture")

      user = User.find_by(email: "gajagajago@snu.ac.kr")

      if user
        user.generate_new_token
        json_response("facebook login successful", true, { user: user}, :ok)
      else
        user = User.new(email: "gajagajago@snu.ac.kr", uid: profile["uid"], provider: "facebook", image: profile["picture"]["data"]["url"], password: Devise.friendly_token[0,20])
        user.authentication_token = User.generate_unique_secure_token

        if user.save
          json_response("facebook sign up successful", true, { user: user}, :ok)
        else
          json_response("facebook sign up fail", false, {}, :failure)
        end
      end
    else
      json_response("no params", false, {}, :failure)
    end
  end
end
