class BearingService
  attr_reader :bearing

  def initialize(bearing)
    @bearing = bearing
  end

  def direction
    case
    when bearing > 337 || bearing <= 22
      "N"
    when bearing.between?(23, 67)
      "NE"
    when bearing.between?(68, 112)
      "E"
    when bearing.between?(113, 157)
      "SE"
    when bearing.between?(158, 202)
      "S"
    when bearing.between?(203, 247)
      "SW"
    when bearing.between?(248, 292)
      "W"
    when bearing.between?(293, 337)
      "NW"
    end
  end
end
