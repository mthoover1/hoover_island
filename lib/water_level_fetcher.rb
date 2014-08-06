require 'mechanize'

class WaterLevelFetcher
  def current_water_level
    meters_to_feet(water_level_in_meters)
  end

  private

  def meters_to_feet(meters)
    meters * 3.28083989501
  end

  def water_level_in_meters
    most_recent_data_string.chomp('*').to_f
  end

  def water_office_url
    yesterday = 1.day.ago
    tomorrow = 1.day.from_now

    yesterday_year  = yesterday.strftime("%Y")
    yesterday_month = yesterday.strftime("%m")
    yesterday_day   = yesterday.strftime("%d")
    tomorrow_year  = tomorrow.strftime("%Y")
    tomorrow_month = tomorrow.strftime("%m")
    tomorrow_day   = tomorrow.strftime("%d")

    "http://www.wateroffice.ec.gc.ca/graph/graph_e.html?mode=text&stn=05PB024&prm1=3&prm2=-1&syr=#{yesterday_year}&smo=#{yesterday_month}&sday=#{yesterday_day}&eyr=#{tomorrow_year}&emo=#{tomorrow_month}&eday=#{tomorrow_day}"
  end

  def most_recent_data_string
    agent = Mechanize.new

    agent.get(water_office_url) do |page|
      form = agent.page.form_with(:action => "/include/disclaimer.php")
      button = form.button_with(:value => "I Agree")
      data_page = agent.submit(form, button)

      return data_page.search('td.bold').last.text
    end
  end
end
