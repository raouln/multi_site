class UsersController < Devise::SessionsController

  def sign_in
    raise params.inspect
  end
  
  
end
