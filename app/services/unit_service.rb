class UnitService
  def self.feet_to_feet_and_inches(measurement)
    feet = measurement.abs.floor
    inches = ((measurement.abs % 1) * 12).round

    if feet > 0
      "#{feet} feet, #{inches} inches"
    else
      "#{inches} inches"
    end
  end

  def self.meters_to_feet(meters)
    meters * 3.28083989501
  end
end
