# :nodoc:
class DatetimeUtilsService
  def self.get_date_range(daterange)
    sdmy, edmy = daterange_splitter(daterange)
    start_date = Time.new(sdmy[2], sdmy[0], sdmy[1]).to_date
    end_date = Time.new(edmy[2], edmy[0].to_i, edmy[1]).to_date
    [start_date, end_date]
  end

  def self.process_date_from_string(dt)
    returnvalue =  check_against_first_format(dt)
    returnvalue == false ? check_against_second_format(dt) : returnvalue
  end

  def self.daterange_splitter(daterange)
    range = daterange.split '-'
    sdmy = range[0].split '/'
    edmy = range[1].split '/'
    [sdmy, edmy]
  end

  def self.check_against_first_format(dt)
    dmy = dt.split '/'
    if dmy.length == 3
      Time.new(dmy[2], dmy[1], dmy[0]).to_date
    else
      false
    end
  end

  def self.check_against_second_format(dt)
    dmy = dt.split '-'
    if dmy.length == 3
      Time.new(dmy[0], dmy[1], dmy[2]).to_date
    else
      false
    end
  end
end
