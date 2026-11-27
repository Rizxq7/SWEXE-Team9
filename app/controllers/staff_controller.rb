class StaffController < ApplicationController
  before_action :require_staff

  def dashboard
    @support_request_count = SupportRequest.count
  end

  private

  def require_staff
    unless logged_in? && current_user.role == "staff"
      redirect_to login_path, alert: "Staff account required."
    end
  end
end
