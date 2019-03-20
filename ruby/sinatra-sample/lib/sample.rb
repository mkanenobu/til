require 'date'

class Sample
  def initialize
    @t = Time.now
  end

  def current
    f(@t)
  end

  def utc
    f(@t.utc)
  end

  private def f(dt)
    dt.strftime('%Y-%m-%d %H:%M:%S')
  end
end
