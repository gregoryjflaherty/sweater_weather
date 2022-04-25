class Hourly
  attr_reader :time,
              :temperature,
              :conditions,
              :icon_string

  def initialize(data)
    @time = Time.at(data[:dt]).strftime("%H:%M:%S")
    @temperature = data[:temp]
    @min_temp = data[:temp]
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
