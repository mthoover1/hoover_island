require 'weather_presenter'
require 'average_water_level_calculator'
require 'water_level_fetcher'

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
    if params['date']
      date = params['date'].to_date
    else
      date = Date.today
    end
    @reservation_requests = ReservationRequest.all
    @date = date
  end

  def weather
  end

  def weather_partial
    @weather = Rails.cache.fetch('weather_presenter', expires_in: 3.minutes) do
      WeatherPresenter.new
    end

    water_level = Rails.cache.fetch('water_level', expires_in: 12.hours) do
      WaterLevelFetcher.new.current_water_level
    end

    @water_level_presenter = WaterLevelPresenter.new(water_level)

    render partial: 'weather_partial'
  end

  def finances
  end

  def contacts
  end

  def visiting
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
