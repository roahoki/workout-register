class EmailVerificationsController < ApplicationController
  allow_unauthenticated_access

  def check
  end

  def verify
    user = User.find_by_token_for(:email_verification, params[:token])
    if user
      user.update!(verified_at: Time.current)
      start_new_session_for(user)
      redirect_to root_path, notice: "Email verified! Welcome to Plannisthenics."
    else
      redirect_to check_email_path, alert: "Verification link is invalid or has expired."
    end
  end

  def resend
    user = User.find_by(email_address: params[:email_address].to_s.strip.downcase)
    if user && !user.verified?
      UserMailer.verify_email(user).deliver_later
    end
    redirect_to check_email_path, notice: "If that email is registered and unverified, we sent a new link."
  end

end
