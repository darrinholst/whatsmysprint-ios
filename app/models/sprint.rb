class Sprint
  include Model

  attr_accessor :name, :start, :end

  def self.current(success, failure)
    BW::HTTP.get('http://still-atoll-1597.herokuapp.com/sprint/current', {:headers => {"Accept" => "application/json"}}) do |response|
      if(response.status_code == 200)
        success.call Sprint.new(BW::JSON.parse(response.body.to_str))
      else
        failure.call "We're Down!"
      end
    end
  end

  def starts_on
    format_date(NSDate.dateWithTimeIntervalSince1970(self.start/1000))
  end

  def ends_on
    format_date(NSDate.dateWithTimeIntervalSince1970(self.end/1000))
  end

  private

  def format_date(date)
    dateFormatter = NSDateFormatter.alloc.init
    dateFormatter.setDateStyle(NSDateFormatterMediumStyle)
    dateFormatter.stringFromDate(date)
  end
end
