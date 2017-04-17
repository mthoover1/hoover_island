class WaterLevelFetcher
  URL = 'http://wateroffice.ec.gc.ca/report/real_time_e.html?stn=05PB024&mode=Table'

  def current_water_level
    UnitService.meters_to_feet(water_level_in_meters)
  end

  private

  def water_level_in_meters
    water_level_string.to_f
  end

  def water_level_string
    page = Nokogiri::HTML(water_office_http_response)
    page.css('table').first.css('tbody tr:last td:last').text
  end

  def water_office_http_response
    uri = URI(URL)
    http = Net::HTTP.new(uri.host, 80)
    request = Net::HTTP::Get.new(uri.request_uri)
    disclaimer_cookie = CGI::Cookie.new('disclaimer', 'agree')
    request['Cookie'] = disclaimer_cookie.to_s
    http.request(request).body
  end
end
