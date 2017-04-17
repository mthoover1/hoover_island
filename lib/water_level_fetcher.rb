require 'mechanize'

class WaterLevelFetcher
  URL = 'http://wateroffice.ec.gc.ca/report/real_time_e.html?stn=05PB024&mode=Table'

  def current_water_level
    UnitService.meters_to_feet(water_level_in_meters)
  end

  private

  def water_level_in_meters
    most_recent_data_string.chomp('*').to_f
  end

  def most_recent_data_string
    agent = Mechanize.new

    agent.get(URL) do |page|
      form = agent.page.form_with(action: "/disclaimer_e.html")
      button = form.button_with(value: "I Agree")
      data_page = agent.submit(form, button)

      return data_page.search('table:first tbody tr:last td:last').first.text
    end
  end
end
