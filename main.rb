require 'date'

class Car
  attr_reader :plate_number

  def initialize plate_number
    @plate_number = plate_number
  end

end


class TrafficController

  @@wdays_calendar = {
    1=>[1,2],
    2=>[3,4],
    3=>[5,6],
    4=>[7,8],
    5=>[9,0],
  }
  
  def am_range date_str
    DateTime.strptime("#{date_str} 07:00", '%Y-%m-%d %R')..DateTime.strptime("#{date_str} 09:30", '%Y-%m-%d %R')
  end

  def pm_range date_str
    DateTime.strptime("#{date_str} 16:00", '%Y-%m-%d %R')..DateTime.strptime("#{date_str} 19:30", '%Y-%m-%d %R')
  end

  def can_be_on_the_road?(car, date_str, time_str)
    last_digit = car.plate_number % 10
    date = DateTime.strptime("#{date_str} #{time_str}", '%Y-%m-%d %R')
    if (@@wdays_calendar[date.wday].include? last_digit) && (am_range(date_str).cover?(date) || pm_range(date_str).cover?(date))
      return false
    end
    return true
  end

end
