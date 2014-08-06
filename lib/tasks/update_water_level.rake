require 'water_level_fetcher'

task :update_water_level => :environment do
  Timeout::timeout(60) {
    current_water_level = WaterLevelFetcher.new.current_water_level
    WaterLevel.create(level: current_water_level)
  }
end
