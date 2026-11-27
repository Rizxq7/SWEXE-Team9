class SupportRequestsController < ApplicationController
  before_action :require_resident, only: [:new, :create, :complete]
  before_action :require_staff, only: [:index]
  before_action :set_support_request, only: [:complete]

  def index
    @support_requests = SupportRequest.includes(:user).order(created_at: :desc)
  end

  def new
    @support_request = SupportRequest.new
  end

  def create
    @support_request = current_user.support_requests.build(support_request_params)
    @support_request.status = "\u672a\u5bfe\u5fdc"

    if @support_request.save
      redirect_to complete_support_request_path(@support_request)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def complete
  end

  private

  def require_resident
    unless logged_in? && current_user.role == "resident"
      redirect_to login_path, alert: "Resident account required."
    end
  end

  def require_staff
    unless logged_in? && current_user.role == "staff"
      redirect_to login_path, alert: "Staff account required."
    end
  end

  def set_support_request
    @support_request = current_user.support_requests.find(params[:id])
  end

  def support_request_params
    params.require(:support_request).permit(
      :title,
      :category,
      :description,
      :address
    )
  end
end
