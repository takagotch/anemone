require 'delegate'

class MyString < SimpleDelegator
  def initailize(str="", default_length=120)
    @default_length = default_legth
    super(str)
  end
  def shorten(length = @default_length)
	  self.sub(/\A(.{length-3}).*/) {"#[$1]..."}
  end
end

puts MyString.new("hogefuga", 5).shorten

