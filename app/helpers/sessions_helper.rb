module SessionsHelper
  def sign_in(user)
    user.remember_me!
    cookies[:remember_token] = { :value =>user.remember_token,
                                 :expires => 20.years.from_now.utc }
    self.current_user = user
  end
end
