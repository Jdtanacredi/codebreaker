class Marker
  def initialize(secret, guess)
    @secret, @guess = secret, guess
  end

  def exact_match_count
    (0..3).inject(0) {|count, index | count + (exact_match?(index) ? 1 : 0)}
    #exact_match_count = 0
    #(0..3).each do |index|
    #  if exact_match?(guess, index)
    #    exact_match_count += 1
    #  end
    #end
    #exact_match_count
  end

  def number_match_count
   total_match_count - exact_match_count
    #(0..3).inject(0) do |count, index|
    #  count + (number_match?(index) ? 1 : 0)
    #  #number_match_count = 0
    #  #(0..3).each do |index|
    #  #  if number_match?(guess, index)
    #  #    number_match_count += 1
    #  #  end
    #end
    ##number_match_count
  end

  def total_match_count
    count = 0
    secret = @secret.split('')
    @guess.split('').map do |n|
      if @secret.include?(n)
        @secret.delete_at(@secret.index(n))
        count += 1
      end
    end
    count
  end

  def exact_match?(index)
    @guess[index] == @secret[index]
  end

  def number_match?(index)
    @secret.include?(@guess[index]) && !exact_match?(index)
  end
end