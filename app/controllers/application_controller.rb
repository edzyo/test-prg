class ApplicationController < ActionController::API
  before_action :current_user
  def current_user
    User.find_or_create_by(email: 'test@test.net')
  end
  
end
