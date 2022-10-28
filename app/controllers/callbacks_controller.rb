class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(auto_hash)
    sign_in_and_redirect @user
  end

  private

  def auto_hash
    request.env["omniauth.auth"]
  end
end
