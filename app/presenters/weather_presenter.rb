class WeatherPresenter
  attr_reader :forecast

  def initialize
    ForecastIO.api_key = ENV['FORECAST_IO_KEY']
    @forecast = ForecastIO.forecast(48.7786439, -92.891812)
  end

  def current_temp
    "#{@forecast.currently.temperature.round}°"
  end

  def current_summary
    @forecast.currently.summary
  end

  def current_wind
    "<span class='wind-mph'>#{@forecast.currently.windSpeed.round}</span>mph #{wind_direction}".html_safe
  end

  def near_forecast_summary
    @forecast.hourly.summary
  end

  def forecast_high_temp(day)
    "#{@forecast.daily.data[day].temperatureMax.round}°"
  end

  def forecast_low_temp(day)
    "#{@forecast.daily.data[day].temperatureMin.round}°"
  end

  def forecast_day_of_week(day)
    time = @forecast.daily.data[day].time.to_s
    DateTime.strptime(time,'%s').in_time_zone.strftime("%^a")
  end

  def forecast_sunrise(day)
    seconds_to_time(@forecast.daily.data[day].sunriseTime.to_s)
  end

  def forecast_sunset(day)
    seconds_to_time(@forecast.daily.data[day].sunsetTime.to_s)
  end

  def forecast_precip_type(day)
    precip_type = @forecast.daily.data[day].precipType
    precip_type.present? ? precip_type.capitalize : "Precip."
  end

  def forecast_precip_probability(day)
    "#{(@forecast.daily.data[day].precipProbability * 100).round}%"
  end

  def forecast_summary(day)
    @forecast.daily.data[day].summary
  end

  private

  def seconds_to_time(seconds)
    DateTime.strptime(seconds,'%s').in_time_zone.strftime("%l:%M %P")
  end

  def wind_direction
    BearingService.new(@forecast.currently.windBearing).direction
  end
end
