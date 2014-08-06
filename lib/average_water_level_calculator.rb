class AverageWaterLevelCalculator
  def initialize(date)
    @date = date
  end

  def average
    average1 = (MONTHLY_DATA[month.to_s][:low] + MONTHLY_DATA[month.to_s][:high]) / 2.0
    average2 = (MONTHLY_DATA[next_month.to_s][:low] + MONTHLY_DATA[next_month.to_s][:high]) / 2.0

    change = average2 - average1
    percent_of_change = (day - 1) / days_in_month.to_f

    average = average1 + (change * percent_of_change)
  end

  def high
    high_or_low(:high)
  end

  def low
    high_or_low(:low)
  end

  private

  def high_or_low(high_or_low)
    value1 = MONTHLY_DATA[month.to_s][high_or_low]
    value2 = MONTHLY_DATA[next_month.to_s][high_or_low]

    change = value2 - value1
    percent_of_change = (day - 1) / days_in_month.to_f

    average = value1 + (change * percent_of_change)
  end

  def month
    @month ||= @date.month
  end

  def day
    @day ||= @date.day
  end

  def next_month
    @next_month ||= month < 12 ? month + 1 : 1
  end

  def days_in_month
    @days_in_month ||= Time.days_in_month(month, @date.year)
  end

  MONTHLY_DATA = {
    '1' => {
      low: 1106.299,
      high: 1107.152
    },
    '2' => {
      low: 1105.774,
      high: 1106.627
    },
    '3' => {
      low: 1105.249,
      high: 1106.217
    },
    '4' => {
      low: 1104.659,
      high: 1105.643
    },
    '5' => {
      low: 1104.987,
      high: 1106.955
    },
    '6' => {
      low: 1106.627,
      high: 1107.612
    },
    '7' => {
      low: 1107.283,
      high: 1108.104
    },
    '8' => {
      low: 1107.283,
      high: 1108.104
    },
    '9' => {
      low: 1107.208,
      high: 1108.022
    },
    '10' => {
      low: 1106.988,
      high: 1107.907
    },
    '11' => {
      low: 1106.824,
      high: 1107.743
    },
    '12' => {
      low: 1106.627,
      high: 1107.612
    }
  }
end
