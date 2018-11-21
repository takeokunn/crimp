class SignFormController < ApplicationController
  def sign_up
  end
  
  def sign_in
  end
  
  def create
    @user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password])
    @user.save
    redirect_to("/user_page/#{@user.id}")
  end
end
