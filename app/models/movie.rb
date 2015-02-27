class Movie < ActiveRecord::Base
  validates_presence_of :title, :rating, :total_gross
  # If the movie's total_gross is less than 50m it's a flop
  def flop?
    total_gross.blank? || total_gross < 50000000
  end

# method to sort the data based on the latest released_on date
  def self.released
    where("released_on <= ?" , Time.now).order("released_on desc")
  end
end
