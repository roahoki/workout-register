class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    if @user.save
      UserMailer.verify_email(@user).deliver_later
      redirect_to check_email_path, notice: "Account created! Check your email to verify your address."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.expect(user: [ :email_address, :password, :password_confirmation ])
  end
end
