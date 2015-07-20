class WaterLevelPresenter
  attr_reader :water_level

  def initialize(water_level)
    @water_level = water_level
  end

  def feet_and_inches
    UnitService.feet_to_feet_and_inches(difference)
  end

  def high_or_low
    difference >= 0 ? 'high' : 'low'
  end

  def alert?
    water_level > normal_upper_limit || water_level < normal_lower_limit
  end

  private

  def difference
    water_level - average_water_level
  end

  def average_water_level
    @average_water_level ||= water_level_calculator.average
  end

  def normal_upper_limit
    @normal_upper_limit ||= water_level_calculator.high
  end

  def normal_lower_limit
    @normal_lower_limit ||= water_level_calculator.low
  end

  def water_level_calculator
    @water_level_calculator ||= AverageWaterLevelCalculator.new
  end
end
