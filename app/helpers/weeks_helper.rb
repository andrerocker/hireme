module WeeksHelper
  def days
    @day_names ||= begin
      days = I18n.t('date.day_names').clone
      days.push(days.shift)
    end
  end

  def hours
    (6..23).collect { |current| "#{current}:00".rjust(5, "0") }
  end

  def resolve_schedule(hour, day)
    @schedulings.detect {|sched| sched.hour.eql?(hour) and sched.day.eql?(day)}
  end
end
