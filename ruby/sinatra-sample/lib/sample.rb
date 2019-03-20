#
class Sample
  def initialize
    @t = Time.now
  end

  def date_time
    @t.strftime('%Y-%m-%d %H:%M:%S')
  end
end
