class AdminController < ApplicationController
  before_filter :check_session
  before_filter :check_admin_access

  def dashboard
    @requests = ReservationRequest.all.order(:start_date)
  end

  def accept_request
    request = ReservationRequest.find_by_id(params[:id])

    if request
      accepted_status = ReservationStatus.find_by_status('Accepted')
      request.update_attributes(reservation_status: accepted_status, trip_approved: true)
    end

    redirect_to admin_path
  end

  def flag_request
    request = ReservationRequest.find_by_id(params[:id])

    if request
      conflict_status = ReservationStatus.find_by_status('Possible Conflicts')
      request.update_attributes(reservation_status: conflict_status, trip_approved: false)
    end

    redirect_to admin_path
  end

  def deny_request
    request = ReservationRequest.find_by_id(params[:id])

    if request
      denied_status = ReservationStatus.find_by_status('Denied')
      request.update_attributes(reservation_status: denied_status, trip_approved: false)
    end

    redirect_to admin_path
  end

  private

  def check_session
    if !session[:person_id]
      redirect_to login_url
    end
  end

  def check_admin_access
    if current_user.account.admin == false
      flash[:alert] = 'You do not have access to view that page.'
      redirect_to root_url
    end
  end
end
