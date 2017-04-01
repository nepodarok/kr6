class Comment < ActiveRecord::Base
  belongs_to :user
  RAIT = (1..5).to_a
  validates :content, presence: true
  validates :star, presence: true, numericality: true

  validates_numericality_of :star, :greater_than_or_equal_to => 1
  validates_numericality_of :star, :less_than_or_equal_to => 5

end
