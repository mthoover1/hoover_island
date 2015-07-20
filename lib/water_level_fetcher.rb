require 'mechanize'

class WaterLevelFetcher
  STATION_ID = '05PB024'

  def current_water_level
    UnitService.meters_to_feet(water_level_in_meters)
  end

  private

  def water_level_in_meters
    most_recent_data_string.chomp('*').to_f
  end

  def water_office_url
    yesterday = Date.yesterday.strftime("%Y-%m-%d")
    today = Date.today.strftime("%Y-%m-%d")

    "http://wateroffice.ec.gc.ca/report/report_e.html?mode=Table&type=realTime&stn=#{STATION_ID}&dataType=&startDate=#{yesterday}&endDate=#{today}&prm1=46&prm2=47"
  end

  def most_recent_data_string
    agent = Mechanize.new

    agent.get(water_office_url) do |page|
      form = agent.page.form_with(:action => "/include/disclaimer.php")
      button = form.button_with(:value => "I Agree")
      data_page = agent.submit(form, button)

      return data_page.search('table:first tr:last td:last').first.text
    end
  end
end
