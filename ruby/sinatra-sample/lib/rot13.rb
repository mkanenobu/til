
class Rot13
  def initialize(str)
    @s = str.each_char.map do |c|
      ch = c.downcase
      if ch =~ /[a-m]/
        (c.ord + 13).chr
      elsif ch =~ /[n-z]/
        (c.ord - 13).chr
      else
        c
      end
    end
  end

  def to_s
    @s.join
  end

  attr_reader :s
end

