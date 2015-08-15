module SessionsHelper
  def current_user?(user)
    user == current_user
  end

  # before_action
  def signed_in_user
    return if user_signed_in?
    redirect_to new_user_session_path, alert: t("alerts.signed_in_user")
  end
end
