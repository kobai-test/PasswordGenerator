class PasswordGenerator
  def initialize
    @capital_letters    = %w(A B C D E F G H   J K L M N   P Q R S T U V W X Y Z)
    @small_letters      = %w(a b c d e f g h i j k   m n o p q r s t u v w x y z)
    @numeric_characters = %w(2 3 4 5 6 7 8 9)
    @all_characters     = @capital_letters + @small_letters + @numeric_characters
  end

  def generate(n)
    raise if n < 8
    raise if n > 32

    temp  = @capital_letters.sample
    temp += @small_letters.sample
    temp += @numeric_characters.sample
    (n - 3).times do
      temp += @all_characters.sample
    end
    temp.split("").shuffle.join
  end
end

if $0 == __FILE__
  # direct call
  if ARGV[0] =~ /\A\d+\Z/
    pg = PasswordGenerator.new
    puts pg.generate ARGV[0].to_i
  else
    puts "Usage: #{__FILE__} number"
    exit 1
  end
end
