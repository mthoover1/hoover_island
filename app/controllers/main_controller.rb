require 'weather_presenter'

class MainController < ApplicationController
  before_filter :check_session

  def home
    set_days_left_message
  end

  def history
    @trips = Trip.all.order(:year).reverse
    @years = @trips.map(&:year).uniq
    @leaderboard = Person.all.sort_by(&:trip_count).reverse
  end

  def calendar
     @reservation_requests = ReservationRequest.all
     # @reservation_requests = @reservation_requests.order(&:start_date)
     @date = Date.today
  end

  def weather
    @weather = WeatherPresenter.new
  end

  private

  def set_days_left_message
    today = Time.zone.today
    year = today.strftime("%Y").to_i
    next_year = year + 1

    this_season_start = "#{year}/06/01".to_date
    this_season_end   = "#{year}/09/15".to_date
    next_season_start = "#{next_year}/06/01".to_date

    if today < this_season_start
      @days_left = "#{(this_season_start - today).to_i} days"
      @days_left_message = "until the season begins."
    elsif today == this_season_start
      @days_left = "Season opens today!"
      @days_left_message = nil
    elsif today > this_season_start && today < this_season_end
      @days_left = "#{(this_season_end - today).to_i} days"
      @days_left_message = "until the season ends."
    elsif today == this_season_end
      @days_left = "Season ends today..."
      @days_left_message = nil
    elsif today > this_season_end
      @days_left = "#{(next_season_start - today).to_i} days"
      @days_left_message = "until next season begins."
    end
  end

  def check_session
    if !session[:person_id]
      redirect_to login_url
    end
  end
end
