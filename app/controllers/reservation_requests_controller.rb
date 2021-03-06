class ReservationRequestsController < ApplicationController
  def index
    @requests = ReservationRequest.all
  end

  def new
    @reservation_request = ReservationRequest.new
  end

  def create
    params.require(:reservation_request).permit!

    format_param_dates

    reservation_request = ReservationRequest.new(params[:reservation_request])
    if reservation_request.save
      flash[:notice] = 'Reservation request submitted'
      redirect_to calendar_path
    else
      flash[:alert] = reservation_request.errors.full_messages.to_sentence
      redirect_to new_reservation_request_path
    end
  end

  private

  def format_param_dates
    return if !dates_present?

    formatted_start_date = Date.strptime(params[:reservation_request][:start_date], "%m/%d/%Y")
    formatted_end_date = Date.strptime(params[:reservation_request][:end_date], "%m/%d/%Y")

    params[:reservation_request][:start_date] = formatted_start_date
    params[:reservation_request][:end_date] = formatted_end_date
  end

  def dates_present?
    params[:reservation_request][:start_date].present? && params[:reservation_request][:end_date].present?
  end
end
